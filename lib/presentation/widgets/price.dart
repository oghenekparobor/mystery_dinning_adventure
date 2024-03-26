import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mystery_dinning_adventure/core/extension/context.dart';
import 'package:mystery_dinning_adventure/presentation/notifier/notifier.dart';
import 'package:provider/provider.dart';

class PriceRange extends StatelessWidget {
  const PriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    var fmt = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    return Consumer<MyNotifier>(
      builder: (_, value, __) => StatefulBuilder(
        builder: (context, setState) {
          return Column(
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
                    '${fmt.format(value.startCost)} - ${fmt.format(value.endCost)}',
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
              8.verticalSpace,
              RangeSlider(
                min: 5,
                max: 10000,
                divisions: 5000,
                labels: RangeLabels(
                  fmt.format(value.startCost),
                  fmt.format(value.endCost),
                ),
                onChanged: (v) {
                  setState(() {
                    value.startCost = v.start;
                    value.endCost = v.end;
                  });
                },
                values: RangeValues(
                  value.startCost ?? 0.0,
                  value.endCost ?? 0.0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
