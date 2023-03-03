import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isMonitoringProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

class ActionButton extends HookConsumerWidget {
  const ActionButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMonitoring =
        ref.watch(isMonitoringProvider); // true for expose , false for hide
    return LayoutBuilder(builder: (context, constraints) {
      return TextButton(
          onPressed: () {
            ref.read(isMonitoringProvider.notifier).state =
                !ref.read(isMonitoringProvider.notifier).state;
          },
          style: ButtonStyle(
              splashFactory: InkRipple.splashFactory,
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
                          color: Colors.black,
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
            children: [
              Icon(Icons.front_hand_sharp,size: constraints.maxHeight*0.15,)
              Text(
                isMonitoring ? "Stop Monitoring" : "Check Battery Level",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: constraints.maxHeight * 0.25),
              ),
            ],
          ));
    });
  }
}
