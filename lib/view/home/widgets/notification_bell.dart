import 'package:BatteryStatus/model/provider/notification/notification_notifier.dart';
import 'package:BatteryStatus/view/shared/flushbar_util.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationBell extends HookConsumerWidget {
  const NotificationBell({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAllowed = ref.watch(notificationProvider);
    return LayoutBuilder(builder: (context, constraints) {
      return IconButton(
        splashRadius: constraints.maxWidth * 0.3,
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
          ref.read(notificationProvider.notifier).toggle();
          FlashbarUtil.showUtilFlashbar(
              // Custom class to enhance reusability of the shared widgets.
              context: context,
              leftBarIndicatorColor:
                  isAllowed ? Colors.redAccent : Colors.lightGreenAccent,
              msg: isAllowed
                  ? "Notifications are inactive"
                  : "Notifications are active",
              actionMsg: "Dismiss");
        },
        color: Colors.grey,
      );
    });
  }
}
