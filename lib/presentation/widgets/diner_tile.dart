import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/app_core.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';
import 'package:mystery_dinning_adventure/data/models/restaurant.dart';

class DinerTile extends StatelessWidget {
  const DinerTile({
    super.key,
    required this.model,
  });

  final RestaurantModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          Strings.dinerDeatils,
          extra: {
            'fromResult': false,
            'restaurant': model.toJson(),
          },
        );
      },
      child: Container(
        // padding: EdgeInsets.symmetric(
        //   horizontal: 16.w,
        //   vertical: 16.h,
        // ),
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
              width: 120.w,
              height: 150.h,
              child: Hero(
                tag: model.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  ),
                  child: Image.network(
                    model.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: context.textTheme.headlineSmall,
                  ),
                  Text(
                    model.phone,
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
