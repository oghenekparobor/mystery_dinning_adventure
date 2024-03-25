import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.isSelected,
    required this.title,
    this.onTap,
  });

  final bool isSelected;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Pulse(
        animate: isSelected,
        infinite: isSelected,
        duration: const Duration(milliseconds: 2000),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          margin: EdgeInsets.only(
            left: 16.w,
            bottom: 16.h,
          ),
          decoration: BoxDecoration(
            color: !isSelected ? Colors.grey.shade100 : Colors.amber.shade100,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Text(
            title,
            style: context.textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
