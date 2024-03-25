import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.color,
    this.onTap,
  });

  final String text;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      elevation: 0,
      color: color ?? Colors.amber,
      padding: EdgeInsets.symmetric(
        horizontal: 45.w,
        vertical: 20.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: context.textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
