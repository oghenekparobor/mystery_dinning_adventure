import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/app_core.dart';
import 'package:mystery_dinning_adventure/presentation/notifier/notifier.dart';
import 'package:provider/provider.dart';

class ChangeLocation extends StatelessWidget {
  const ChangeLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Strings.locationPage),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(),
        ),
        child: Consumer<MyNotifier>(
          builder: (context, value, child) => Row(
            children: [
              child!,
              8.horizontalSpace,
              Expanded(
                child: Text(
                  value.setCoordinates == null
                      ? 'Click to Pick Location'
                      : 'Change Location (${value.setCoordinates?.latitude}, ${value.setCoordinates?.longitude})',
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          child: const Icon(Icons.my_location),
        ),
      ),
    );
  }
}
