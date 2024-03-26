import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/__resources_export.dart';
import 'package:mystery_dinning_adventure/core/app_core.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';
import 'package:mystery_dinning_adventure/core/resources/primary_button.dart';
import 'package:mystery_dinning_adventure/data/models/restaurant.dart';
import 'package:mystery_dinning_adventure/presentation/notifier/notifier.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/category_chip.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/leave_a_review.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/review.item.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/title_content.dart';
import 'package:provider/provider.dart';

class DinerDetails extends StatelessWidget {
  const DinerDetails({
    super.key,
    this.fromResult = false,
    this.restaurant,
  });

  final bool fromResult;
  final RestaurantModel? restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diner Title',
          style: context.textTheme.bodyMedium,
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (restaurant != null) ...{
            SizedBox(
              height: 250.h,
              width: double.infinity,
              child: Image.network(
                restaurant!.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          },
          16.verticalSpace,
          Expanded(
            child: DefaultTabController(
              length: fromResult ? 1 : 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Details',
                          style: context.textTheme.headlineSmall,
                        ),
                      ),
                      if (!fromResult) ...{
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Review',
                            style: context.textTheme.headlineSmall,
                          ),
                        ),
                      }
                    ],
                  ),
                  16.verticalSpace,
                  Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                for (var i in restaurant?.categories ?? []) ...{
                                  CategoryChip(
                                    isSelected: false,
                                    title: i.title,
                                  ),
                                },
                              ],
                            ),
                            16.verticalSpace,
                            TitleContent(
                              title: 'Name',
                              content: restaurant?.name ?? '',
                            ),
                            16.verticalSpace,
                            TitleContent(
                              title: 'Phone',
                              content: restaurant?.phone ?? '',
                            ),
                            16.verticalSpace,
                            TitleContent(
                              title: 'Addres',
                              content: restaurant?.location.address1 ?? '',
                            ),
                            16.verticalSpace,
                            TitleContent(
                              title: 'Distance Away',
                              content: (restaurant?.distance ?? 0.0)
                                  .toStringAsFixed(2),
                            ),
                            16.verticalSpace,
                            TitleContent(
                              title: 'Rating',
                              content: (restaurant?.rating ?? 0.0)
                                  .toStringAsFixed(1),
                            ),
                          ],
                        ),
                        if (!fromResult) ...{
                          FutureBuilder(
                            future: context.myn.fetchReviews(
                              restaurant?.id ?? '',
                            ),
                            builder: (context, snapshot) {
                              if (context.myn.reviews != null) {
                                return Consumer<MyNotifier>(
                                  builder: (_, v, child) =>
                                      SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        child!,
                                        16.verticalSpace,
                                        for (var r in v.reviews!) ...{
                                          ReviewItem(
                                            dateTime: DateTime.parse(
                                              r['review_date'],
                                            ),
                                            rating: r['rating'],
                                            review: r['review'],
                                          ),
                                          const Divider()
                                        }
                                      ],
                                    ),
                                  ),
                                  child: LeaveAReview(id: restaurant?.id ?? ''),
                                );
                              }

                              return const SizedBox();
                            },
                          )
                        }
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (fromResult) ...{
            16.verticalSpace,
            PrimaryButton(
              text: 'Add to Adventure Log',
              onTap: () {
                if (restaurant != null) {
                  context.myn.addToLog(restaurant!);

                  context.go(Strings.homePage);
                  context.notify.addNotification(
                    const NotificationTile(message: 'Added to Adventure log'),
                  );
                }
              },
              color: Colors.amber.shade100,
            ).padHorizontal,
            30.verticalSpace,
          }
        ],
      ),
    );
  }
}
