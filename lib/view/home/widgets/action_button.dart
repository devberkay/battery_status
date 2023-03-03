import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isExposeProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

class ActionButton extends HookConsumerWidget {
  const ActionButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpose =
        ref.watch(isExposeProvider); // true for expose , false for hide
    return LayoutBuilder(builder: (context, constraints) {
      return TextButton(
          onPressed: () {
            ref.read(isExposeProvider.notifier).state =
                !ref.read(isExposeProvider.notifier).state;
          },
          style: ButtonStyle(
              splashFactory: InkRipple.splashFactory,
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (isExpose) {
                  return Colors.red;
                } else {
                  return Colors.green;
                }
              }),
              shape: MaterialStateProperty.resolveWith((states) {
                if (isExpose) {
                  return RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(constraints.maxHeight * 0.5),
                      side: BorderSide(
                          color: Colors.red,
                          width: constraints.maxHeight * 0.02));
                } else {
                  return RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(constraints.maxHeight * 0.5),
                      side: BorderSide(
                          color: Colors.green,
                          width: constraints.maxHeight * 0.02));
                }
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (isExpose) {
                  return Colors.white;
                } else {
                  return Colors.white;
                }
              }),
              fixedSize: MaterialStatePropertyAll(
                  Size(constraints.maxWidth, constraints.maxHeight))),
          child: Text(
            isExpose ? "Stop Listening" : "Check Battery Level",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: constraints.maxHeight * 0.25),
          ));
    });
  }
}
