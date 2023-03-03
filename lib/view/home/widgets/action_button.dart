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
        useState(false); // true for expose , false for hide
    return LayoutBuilder(builder: (context, constraints) {
      return TextButton(
          onPressed: () {
            ref.read(isExposeProvider.notifier).state =
                !ref.read(isExposeProvider.notifier).state;
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed) || isExpose.value) {
                  return Colors.black;
                } else {
                  return Colors.white;
                }
              }),
              shape: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed )|| isExpose.value) {
                  return RoundedRectangleBorder(
                      side: BorderSide(
                          color:  Colors.white,width: constraints.maxHeight*0.025));
                } else {
                  return RoundedRectangleBorder(
                      side: BorderSide(
                          color: isExpose.value ? Colors.green : Colors.white));
                }
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed) || isExpose.value) {
                  return Colors.white;
                } else {
                  return Colors.white;
                }
              }),
              fixedSize: MaterialStatePropertyAll(
                  Size(constraints.maxWidth, constraints.maxHeight))),
          child: Text(
            "Check Battery Level",
            style: TextStyle(
                fontSize: constraints.maxHeight * 0.25,
                color: isExpose.value ? Colors.green : Colors.white),
          ));
    });
  }
}
