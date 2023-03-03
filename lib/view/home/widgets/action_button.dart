import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isExposeProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

class ActionButton extends HookConsumerWidget {
  const ActionButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(onPressed: () {
      ref.read(isExposeProvider.notifier).state = !ref.read(isExposeProvider.notifier).state;
    }, child: Text("Check Battery Level"),style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) => null)
    ));
  }
}