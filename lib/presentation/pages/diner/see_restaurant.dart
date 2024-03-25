import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';
import 'package:mystery_dinning_adventure/core/resources/primary_button.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/category_chip.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/title_content.dart';

class DinerDetails extends StatelessWidget {
  const DinerDetails({
    super.key,
    this.fromResult = false,
  });

  final bool fromResult;

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
          SizedBox(
            height: 250.h,
            width: double.infinity,
            child: const Placeholder(),
          ),
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
                                for (var i = 0; i < 4; i++) ...{
                                  CategoryChip(
                                    isSelected: false,
                                    title: '$i title',
                                  )
                                },
                              ],
                            ),
                            16.verticalSpace,
                            const TitleContent(
                              title: 'Name',
                              content: 'Jonathan Doe',
                            ),
                            16.verticalSpace,
                            const TitleContent(
                              title: 'Phone',
                              content: '+2349060257738',
                            ),
                            16.verticalSpace,
                            const TitleContent(
                              title: 'Addres',
                              content: 'Lekki-Ajah, Lagos, Nigeria',
                            ),
                            16.verticalSpace,
                            const TitleContent(
                              title: 'Distance Away',
                              content: '3KM',
                            ),
                            16.verticalSpace,
                            const TitleContent(
                              title: 'Rating',
                              content: '5',
                            ),
                          ],
                        ),
                        if (!fromResult) ...{
                          const Placeholder(),
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
              onTap: () {},
              color: Colors.amber.shade100,
            ).padHorizontal,
            30.verticalSpace,
          }
        ],
      ),
    );
  }
}