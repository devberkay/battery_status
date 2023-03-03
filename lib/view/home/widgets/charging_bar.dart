import 'package:BatteryStatus/view/home/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

final batteryPercentageProvider =
    StreamProvider.autoDispose<double>((ref) async* {
  yield 0.34;
});

class ChargingBar extends HookConsumerWidget {
  const ChargingBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMonitoring =
        ref.watch(isMonitoringProvider); // true for expose , false for hide

    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: LiquidLinearProgressIndicator(
          
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
