import 'dart:async';
import 'dart:math';

import 'package:BatteryStatus/view/home/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

final batteryPercentageProvider =
    StreamProvider.autoDispose<double>((ref) async* {
  final periodicStream =
      Stream.periodic(const Duration(milliseconds: 5000), (counter) async* {
    yield Random.secure().nextDouble();
  });
  await for (var streamController in periodicStream) {
    await for (var randomDouble in streamController) {
      yield randomDouble;
    }
  }
});

class ChargingBar extends HookConsumerWidget {
  const ChargingBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMonitoring =
        ref.watch(isMonitoringProvider); // true for expose , false for hide
    final randomNo = ref.watch(batteryPercentageProvider).asData?.value ?? 0.5;
    final percentageController = useAnimationController(
        duration: Duration(milliseconds: 1000), initialValue: randomNo);
    useEffect(() {
      percentageController.forward();
    });
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: LiquidLinearProgressIndicator(
          value: randomNo,
          primaryChild: Padding(
            padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.05),
            child: Text(
              "%${(randomNo * 100).toStringAsFixed(2)}",
              style: TextStyle(
                  fontSize: constraints.maxWidth * 0.15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          secondaryChild:
              Icon(Icons.bolt_sharp, size: constraints.maxWidth * 0.5),
          borderRadius: constraints.maxHeight * 0.25,
          direction: Axis.vertical,
          borderWidth: constraints.maxHeight * 0.01,
          backgroundColor: Colors.grey.shade400,
          borderColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation(Colors.white),
        ),
      );
    });
  }
}
