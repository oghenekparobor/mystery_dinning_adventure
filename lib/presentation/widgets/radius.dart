import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/presentation/notifier/notifier.dart';
import 'package:provider/provider.dart';

class Radius extends StatelessWidget {
  const Radius({super.key});

  @override
  Widget build(BuildContext context) {
    var fmt = NumberFormat.currency(symbol: '', decimalDigits: 0);

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
                    'How Far Away?',
                    style: context.textTheme.labelMedium,
                  ),
                  const Spacer(),
                  Text(
                    '${fmt.format(value.km)}KM away',
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
              8.verticalSpace,
              Slider(
                value: value.km,
                min: 1,
                max: 40,
                divisions: 15,
                label: '${fmt.format(value.km)}KM',
                onChanged: (double v) {
                  setState(() => value.km = v);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
