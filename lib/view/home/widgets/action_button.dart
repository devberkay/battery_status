import 'package:BatteryStatus/model/data/monitoring_state.dart';
import 'package:BatteryStatus/model/provider/monitoring/battery_notifier.dart';
import 'package:BatteryStatus/model/provider/monitoring/monitoring_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isButtonActivatedProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

class ActionButton extends HookConsumerWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMonitoring = ref.watch(monitoringStateProvider).when(
        monitoring: (__) => true, idle: (__) => false);
    return LayoutBuilder(builder: (context, constraints) {
      return TextButton(
          onPressed: () {
            if (isMonitoring) {
              ref.read(monitoringStateProvider.notifier).state= const MonitoringState.idle("Mock battery is shown");
            } else {
              ref.read(monitoringStateProvider.notifier).state= const MonitoringState.monitoring("Device battery is shown");
            }
          },
          style: ButtonStyle(
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              alignment: Alignment.center,
              splashFactory: InkSparkle.splashFactory,
              overlayColor: MaterialStatePropertyAll(Colors.grey.shade400),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (isMonitoring) {
                  return Colors.grey;
                } else {
                  return Colors.black;
                }
              }),
              shape: MaterialStateProperty.resolveWith((states) {
                if (isMonitoring) {
                  return RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(constraints.maxHeight * 0.5),
                      side: BorderSide(
                          color: Colors.grey,
                          width: constraints.maxHeight * 0.05));
                } else {
                  return RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(constraints.maxHeight * 0.5),
                      side: BorderSide(
                          color: Colors.transparent,
                          width: constraints.maxHeight * 0.05));
                }
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (isMonitoring) {
                  return Colors.white;
                } else {
                  return Colors.white;
                }
              }),
              fixedSize: MaterialStatePropertyAll(
                  Size(constraints.maxWidth, constraints.maxHeight))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 6,
              ),
              Icon(
                isMonitoring ? Icons.front_hand_sharp : Icons.bolt_sharp,
                size: constraints.maxWidth * 0.08,
                color: isMonitoring ? Colors.grey : Colors.black,
              ),
              const Spacer(),
              Text(
                isMonitoring ? "Stop Monitoring" : "Check Battery Level",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: constraints.maxWidth * 0.075),
              ),
              const Spacer(
                flex: 6,
              )
            ],
          ));
    });
  }
}
