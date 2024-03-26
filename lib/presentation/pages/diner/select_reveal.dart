import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/core/app_strings.dart';
import 'package:mystery_dinning_adventure/core/extension/context.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';

class SelectDiningReveal extends StatelessWidget {
  const SelectDiningReveal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          16.verticalSpace,
          Expanded(
            child: Pulse(
              delay: const Duration(seconds: 5),
              child: ElasticIn(
                child: GestureDetector(
                  onTap: () {
                    context.push(Strings.revealRestaurant);
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.maxFinite,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                          spreadRadius: .3,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mystery Search',
                          style: context.textTheme.headlineLarge,
                        ),
                        8.verticalSpace,
                        Text(
                          'We provide you with the best\nmatch based on your preference',
                          style: context.textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        ).padHorizontal,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: ElasticIn(
              child: GestureDetector(
                onTap: () {
                  context.push(
                    Strings.spinAWheel,
                    extra: (context.myn.businesses['businesses'] as List)
                        .map((e) => NetworkImage((e['image_url'].isEmpty)
                            ? 'https://cdn.vox-cdn.com/thumbor/TnQsfRLuAXU14TbXIjDLugrS8_0=/0x0:1000x640/1400x1400/filters:focal(500x320:501x321)/cdn0.vox-cdn.com/uploads/chorus_asset/file/8988591/Yelp_trademark_RGB_outline.jpg'
                            : e['image_url']))
                        .toList(),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: double.maxFinite,
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3,
                        spreadRadius: .3,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Culinary Roulette',
                        style: context.textTheme.headlineLarge,
                      ),
                      8.verticalSpace,
                      Text(
                        'Spin a wheel and get recommended a diner',
                        style: context.textTheme.labelLarge,
                        textAlign: TextAlign.center,
                      ).padHorizontal,
                    ],
                  ),
                ),
              ),
            ),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
