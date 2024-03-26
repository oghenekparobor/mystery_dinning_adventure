import 'package:dart_casing/dart_casing.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/__network_export.dart';
import 'package:mystery_dinning_adventure/core/__resources_export.dart';
import 'package:mystery_dinning_adventure/core/app_strings.dart';
import 'package:mystery_dinning_adventure/core/extension/state.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';
import 'package:mystery_dinning_adventure/core/resources/loader.dart';
import 'package:mystery_dinning_adventure/core/resources/primary_button.dart';
import 'package:mystery_dinning_adventure/presentation/notifier/notifier.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/category_chip.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/change_location.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/date.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/price.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/radius.dart';
import 'package:provider/provider.dart';

class SetDinningPreference extends StatefulWidget {
  const SetDinningPreference({super.key});

  @override
  State<SetDinningPreference> createState() => _SetDinningPreferenceState();
}

class _SetDinningPreferenceState extends State<SetDinningPreference> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set Dinning Preference',
          style: context.textTheme.bodyMedium,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            30.verticalSpace,
            const ChangeLocation(),
            16.verticalSpace,
            FutureBuilder(
              future: context.myn.getCategories(),
              builder: (context, snapshot) {
                return Consumer<MyNotifier>(
                  builder: (context, value, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Select Categories',
                        style: context.textTheme.labelMedium,
                      ),
                      8.verticalSpace,
                      Wrap(
                        children: [
                          if (value.categories != null) ...{
                            for (var i in value.categories ?? [])
                              CategoryChip(
                                title: Casing.titleCase(i),
                                isSelected: context.myn.isCategorySelected(i),
                                onTap: () => context.myn.addRemoveCategory(i),
                              )
                          } else ...{
                            for (var i = 0; i < 15; i++) ...{
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 8.w,
                                  bottom: 8.h,
                                ),
                                child: FadeShimmer(
                                  height: 30.h,
                                  width: 90.w,
                                  baseColor: Colors.amber.shade50,
                                  highlightColor: Colors.black12,
                                  radius: 30.r,
                                ),
                              ),
                            }
                          }
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            const Radius(),
            16.verticalSpace,
            const PriceRange(),
            16.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Attribute',
                  style: context.textTheme.labelMedium,
                ),
                8.verticalSpace,
                Consumer<MyNotifier>(
                  builder: (context, value, child) => Wrap(
                    children: [
                      for (var i in value.attributes)
                        CategoryChip(
                          title: Casing.titleCase(i),
                          isSelected: value.isAtrributeSelected(i),
                          onTap: () => value.addRemoveAttribute(i),
                        ),
                    ],
                  ),
                )
              ],
            ),
            16.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'How Many Persons',
                  style: context.textTheme.labelMedium,
                ),
                8.verticalSpace,
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    hintText: '1',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      context.myn.numberOfPersons = int.parse(value);
                    } else {
                      context.myn.numberOfPersons = null;
                    }
                  },
                ),
                16.verticalSpace,
                PrimaryDatePicker(
                  dateSelected: (p0) {
                    context.myn.reservationDate = p0;
                  },
                ),
              ],
            ),
            60.verticalSpace,
            PrimaryButton(
              text: 'Search',
              onTap: search,
            ),
            60.verticalSpace,
          ],
        ).padHorizontal,
      ),
    );
  }

  void search() {
    if (context.myn.myLocation == null) {
      context.notify.addNotification(
        const NotificationTile(
          message: 'Select desired location',
          type: NotificationType.warning,
        ),
      );

      context.push(Strings.locationPage);
    } else {
      // Loader
      AppLoader.show();

      context.myn.searchBusiness().then((value) {
        context.pop();

        if (value.isError) {
          context.notify.addNotification(
            NotificationTile(
              message: (value as ErrorState).msg,
              type: NotificationType.error,
            ),
          );
        } else {
          if (context.myn.businesses['total'] < 1) {
            context.notify.addNotification(
              const NotificationTile(
                message:
                    'No restaurants found based on your preference.\nPlease fine-tune your preference',
                type: NotificationType.warning,
              ),
            );
          } else {
            context.push(
              Strings.selectReveal,
              extra: (value as LoadedState).data,
            );
          }
        }
      });
    }
  }
}
