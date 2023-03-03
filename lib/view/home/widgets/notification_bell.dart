import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

class NotificationBell extends HookConsumerWidget {
  const NotificationBell({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAllowed = ref.watch(notificationProvider);
    return LayoutBuilder(builder: (context, constraints) {
      return IconButton(
        icon: Icon(
          isAllowed
              ? Icons.notifications_active_sharp
              : Icons.notifications_off_outlined,
          size: constraints.maxWidth * 0.3,
        ),
        style: IconButton.styleFrom(
            fixedSize:
                Size(constraints.maxWidth * 0.3, constraints.maxWidth * 0.3),
            padding: EdgeInsets.zero,
            alignment: Alignment.center),
        onPressed: () {
          ref.read(notificationProvider.notifier).state = !isAllowed;
        },
        color: Colors.grey,
      );
    });
  }
}
