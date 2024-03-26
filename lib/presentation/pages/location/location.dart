import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/app_strings.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';
import 'package:mystery_dinning_adventure/core/resources/notification.dart';
import 'package:mystery_dinning_adventure/core/resources/primary_button.dart';

class MyLocationPage extends StatefulWidget {
  const MyLocationPage({super.key});

  @override
  State<MyLocationPage> createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<MyLocationPage> {
  @override
  void initState() {
    super.initState();
  }

  bool gettingLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              height: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                image: DecorationImage(
                  image: AssetImage(Strings.mapBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                30.verticalSpace,
                Text(
                  'Set your Location',
                  style: context.textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                12.verticalSpace,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Get the ',
                        style: context.textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'BEST',
                        style: context.textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ' dinning experience\naround you',
                        style: context.textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                gettingLocation
                    ? const CircularProgressIndicator()
                    : PrimaryButton(
                        text: 'Use Current Location',
                        onTap: getLocation,
                      ),
                30.verticalSpace,
              ],
            ).padHorizontal,
          ),
        ],
      ),
    );
  }

  void getLocation() async {
    setState(() {
      gettingLocation = !gettingLocation;
    });

    if (await context.myn.hasPermission()) {
      if (mounted) {
        context.myn.getLocation().then((value) {
          context.pop();
        });
      }
    } else {
      if (mounted) {
        context.notify.addNotification(
          NotificationTile(
            message: 'Location permission denied',
            type: NotificationType.error,
            onTap: () {},
            action: 'Open settings',
          ),
        );
      }
    }
  }
}
