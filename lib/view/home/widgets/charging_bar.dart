import 'dart:async';
import 'dart:math';

import 'package:BatteryStatus/model/provider/monitoring/monitoring_notifier.dart';
import 'package:BatteryStatus/view/home/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

final batteryPercentageProvider =
    StreamProvider.autoDispose<int?>((ref) async* {
  final isMonitoring = ref.watch(isMonitoringProvider);
  final periodicStream =
      Stream.periodic(const Duration(milliseconds: 5000), (counter) async* {
    yield await ref
        .read(monitoringNotifierProvider.notifier)
        .monitorBatteryLevel(ref);
  });
  await for (var streamController in periodicStream) {
    await for (var randomInt in streamController) {
      yield randomInt;
    }
  }
});

class ChargingBar extends HookConsumerWidget {
  const ChargingBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMonitoring =
        ref.watch(isMonitoringProvider); // true for expose , false for hide
    final randomNo = ref.watch(batteryPercentageProvider).asData?.value ??
        Random.secure().nextInt(101);
    final percentageController = useAnimationController(
        upperBound: 100,
        lowerBound: 0,
        duration: const Duration(milliseconds: 1000),
        initialValue: randomNo.toDouble());
    useEffect(() {
      percentageController.animateTo(randomNo.toDouble());
    });
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: AnimatedBuilder(
            animation: percentageController,
            builder: (context, child) {
              return LiquidLinearProgressIndicator(
                value: percentageController.value,
                primaryChild: Padding(
                  padding:
                      EdgeInsets.only(bottom: constraints.maxHeight * 0.05),
                  child: Text(
                    "${randomNo.toStringAsFixed(0)}%",
                    style: TextStyle(
                        fontSize: constraints.maxWidth * 0.16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                secondaryChild: isMonitoring
                    ? Icon(
                        Icons.bolt_sharp,
                        size: constraints.maxWidth * 0.5,
                        color: Colors.black,
                      )
                    : SpinKitThreeBounce(
                        color: Colors.black,
                        size: constraints.maxWidth * 0.4,
                      ),
                borderRadius: constraints.maxHeight * 0.25,
                direction: Axis.vertical,
                borderWidth: constraints.maxHeight * 0.01,
                backgroundColor: Colors.grey.shade400,
                borderColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation(Colors.white),
              );
            }),
      );
    });
  }
}
