import 'package:animate_do/animate_do.dart';
import 'package:dart_casing/dart_casing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/app_strings.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';
import 'package:mystery_dinning_adventure/core/resources/primary_button.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/category_chip.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/change_location.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/date.dart';

class SetDinningPreference extends StatefulWidget {
  const SetDinningPreference({super.key});

  @override
  State<SetDinningPreference> createState() => _SetDinningPreferenceState();
}

class _SetDinningPreferenceState extends State<SetDinningPreference> {
  List<String> cat = [
    'pizza',
    'food',
    'eat-in',
    'fast-foods',
    'african',
    'drinks',
    'soda',
    'diner',
    'fruit',
    'vegatables',
    'cereals',
  ];
  List<String> scat = [];

  List<String> attr = [
    'hot_and_new',
    'deals',
    'gender_neutral_restrooms',
    'open_to_all',
    'wheelchair_accessible',
  ];
  List<String> sattr = [];

  double cs = 5;

  double sc = 1000;
  double ec = 2500;

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
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                // border: Border.all(),
              ),
              child: Column(
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
                      for (var i in cat)
                        CategoryChip(
                          title: Casing.titleCase(i),
                          isSelected: scat.contains(i),
                          onTap: () {
                            setState(() {
                              if (scat.contains(i)) {
                                scat.remove(i);
                              } else {
                                scat.add(i);
                              }
                            });
                          },
                        )
                    ],
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'How Far Away?',
                      style: context.textTheme.labelMedium,
                    ),
                    const Spacer(),
                    Text(
                      '${cs.toStringAsFixed(0)}KM away',
                      style: context.textTheme.labelMedium,
                    ),
                  ],
                ),
                8.verticalSpace,
                Slider(
                  value: cs,
                  min: 1,
                  max: 40,
                  divisions: 15,
                  label: '${cs.toStringAsFixed(0)} KM',
                  onChanged: (double value) {
                    setState(() {
                      cs = value;
                    });
                  },
                ),
              ],
            ),
            16.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Price Range?',
                      style: context.textTheme.labelMedium,
                    ),
                    const Spacer(),
                    Text(
                      '\$${sc.toStringAsFixed(0)} - \$${ec.toStringAsFixed(0)}',
                      style: context.textTheme.labelMedium,
                    ),
                  ],
                ),
                8.verticalSpace,
                RangeSlider(
                  min: 5,
                  max: 10000,
                  divisions: 5000,
                  labels: RangeLabels('\$${sc.toStringAsFixed(0)}',
                      '\$${ec.toStringAsFixed(0)}'),
                  onChanged: (value) {
                    setState(() {
                      sc = value.start;
                      ec = value.end;
                    });
                  },
                  values: RangeValues(sc, ec),
                ),
              ],
            ),
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
                Wrap(
                  children: [
                    for (var i in attr)
                      CategoryChip(
                        title: Casing.titleCase(i),
                        isSelected: sattr.contains(i),
                        onTap: () {
                          setState(() {
                            if (sattr.contains(i)) {
                              sattr.remove(i);
                            } else {
                              sattr.add(i);
                            }
                          });
                        },
                      )
                  ],
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
                ),
                16.verticalSpace,
                PrimaryDatePicker(
                  dateSelected: (p0) {},
                ),
              ],
            ),
            60.verticalSpace,
            PrimaryButton(
              text: 'Search',
              onTap: () {
                context.push(Strings.selectReveal);
              },
            ),
            60.verticalSpace,
          ],
        ).padHorizontal,
      ),
    );
  }
}
