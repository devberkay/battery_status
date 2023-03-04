import 'package:BatteryStatus/model/data/monitoring_state.dart';
import 'package:BatteryStatus/model/provider/monitoring/battery_notifier.dart';
import 'package:BatteryStatus/model/provider/monitoring/monitoring_notifier.dart';
import 'package:BatteryStatus/model/provider/notification/notification_notifier.dart';
import 'package:BatteryStatus/view/shared/flushbar_util.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:BatteryStatus/model/utils/scroll_behavior.dart';

class SharedScaffold extends StatefulHookConsumerWidget {
  const SharedScaffold(
      {super.key, required this.routerState, required this.child});
  final GoRouterState routerState;
  final Widget child;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SharedScaffoldState();
}

class _SharedScaffoldState extends ConsumerState<SharedScaffold> {
  @override
  Widget build(BuildContext context) {
    ref.listen<MonitoringState>(monitoringStateProvider, (previous, next) {
      if (next != previous) {
        next.when(monitoring: (msg) {
          FlashbarUtil.showUtilFlashbar(
              context: context,
              msg: next.msg!,
              leftBarIndicatorColor: Colors.lightGreenAccent,
              actionMsg: "Dismiss");
        }, idle: (msg) {
          FlashbarUtil.showUtilFlashbar(
              context: context,
              leftBarIndicatorColor: Colors.redAccent,
              msg: next.msg!,
              actionMsg: "Dismiss");
        });
      }
    });
    ref.listen(batteryNotifierProvider, (previous, next) {
      final isNotificationsActive = ref.watch(notificationProvider);
      next.whenData((value) {
        if (value != null && isNotificationsActive  && value < 20) {
          
          FlashbarUtil.showUtilFlashbar(
              context: context,
              flushbarPosition: FlushbarPosition.TOP,
              msg: "Battery has dropped to $value%",
              leftBarIndicatorColor: Colors.redAccent,
              actionMsg: "Dismiss");
        }
      });
    });
    return SafeArea(
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Listener(
          onPointerDown: (PointerDownEvent event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            drawerEnableOpenDragGesture: false,
            resizeToAvoidBottomInset: false,
            body: widget.child,
          ),
        ),
      ),
    );
  }
}
