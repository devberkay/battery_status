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
