import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';
import 'package:mystery_dinning_adventure/core/resources/notification.dart';
import 'package:mystery_dinning_adventure/presentation/notifier/notifier.dart';
import 'package:provider/provider.dart';

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
            child: FutureBuilder(
              future: context.myn.getLocation(),
              builder: (_, __) {
                return Consumer<MyNotifier>(
                  builder: (context, value, child) => FlutterLocationPicker(
                    initPosition: LatLong(
                      value.myLocation?.latitude ?? 0,
                      value.myLocation?.longitude ?? 0,
                    ),
                    selectLocationButtonStyle: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.amber,
                      ),
                    ),
                    selectedLocationButtonTextstyle:
                        const TextStyle(fontSize: 18),
                    selectLocationButtonText: 'Set Current Location',
                    selectLocationButtonLeadingIcon: const Icon(Icons.check),
                    initZoom: 11,
                    minZoomLevel: 5,
                    maxZoomLevel: 16,
                    trackMyPosition: true,
                    onError: (e) => print(e),
                    onPicked: (pickedData) {
                      context.myn.setCoordinate(pickedData.latLong);
                      context.pop();
                    },
                    onChanged: (pickedData) {},
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              30.verticalSpace,
              Text(
                'Set your Location',
                style: context.textTheme.displayMedium!.copyWith(
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
              30.verticalSpace,
            ],
          ).padHorizontal,
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
