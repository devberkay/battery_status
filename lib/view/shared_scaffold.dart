import 'package:BatteryStatus/model/provider/monitoring/monitoring_notifier.dart';
import 'package:BatteryStatus/view/shared/flushbar_util.dart';
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
    ref.listen(monitoringNotifierProvider, (previous, next) {
      if (next != previous) {
        next.when(
            monitoring: FlashbarUtil.showUtilFlashbar(
                context: context,
                msg: next.msg ?? "Battery is being shown on the bar",
                leftBarIndicatorColor: Colors.lightGreenAccent,
                actionMsg: "Dismiss"),
            idle: FlashbarUtil.showUtilFlashbar(
                context: context,
                leftBarIndicatorColor: Colors.redAccent,
                msg: next.msg ?? "Battery can't be monitored at the moment",
                actionMsg: "Dismiss"));
      }
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
