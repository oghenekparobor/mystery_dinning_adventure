import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dinning_adventure/core/app_strings.dart';
import 'package:mystery_dinning_adventure/core/extension/context.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';
import 'package:mystery_dinning_adventure/presentation/widgets/arrow.dart';
import 'package:roulette/roulette.dart' as r;
import 'dart:math' as math;

class SpinAWheel extends StatefulWidget {
  const SpinAWheel({
    super.key,
    this.businesses,
  });

  final List? businesses;

  @override
  State<SpinAWheel> createState() => _SpinAWheelState();
}

class _SpinAWheelState extends State<SpinAWheel>
    with SingleTickerProviderStateMixin {
  late r.RouletteController _controller;

  @override
  void initState() {
    super.initState();

    _controller = r.RouletteController(
      vsync: this,
      group: r.RouletteGroup.uniformImages(
        (widget.businesses ?? []).length,
        imageBuilder: (index) => (widget.businesses ?? [])[index],
        styleBuilder: (index) {
          return const TextStyle(color: Colors.black);
        },
      ),
    );
  }

  bool spinning = false;
  int millisecond = 10000;

  void spinAWheel() {
    setState(() {
      spinning = !spinning;
    });

    final random = math.Random();
    final int selected = random.nextInt((widget.businesses ?? []).length);

    _controller
        .rollTo(selected, duration: Duration(milliseconds: millisecond))
        .then((_) {
      // Reveal Restaurant
      context.push(
        Strings.dinerDeatils,
        extra: {
          'fromResult': true,
          'restaurant': context.myn.businesses['businesses'][selected],
        },
      );

      setState(() {
        spinning = !spinning;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: spinning ? null : () => spinAWheel(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                r.Roulette(
                  controller: _controller,
                  style: const r.RouletteStyle(
                    dividerThickness: 0.0,
                    dividerColor: Colors.amber,
                    centerStickSizePercent: 0.05,
                    centerStickerColor: Colors.amber,
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Arrow(),
                )
              ],
            ),
            30.verticalSpace,
            Text(
              spinning ? 'Spinning' : 'Tap to Spin',
              style: context.textTheme.displaySmall,
            ),
          ],
        ).padHorizontal,
      ),
    );
  }
}
