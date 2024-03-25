import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/app_core.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';

class DinerTile extends StatelessWidget {
  const DinerTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Strings.dinerDeatils);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              spreadRadius: .3,
              blurRadius: 3,
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100.w,
              height: 120.h,
              child: const Placeholder(),
            ),
            8.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Restaurant Name',
                    style: context.textTheme.headlineSmall,
                  ),
                  Text(
                    'Lorem Ipsum',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ).padHorizontal,
    );
  }
}
