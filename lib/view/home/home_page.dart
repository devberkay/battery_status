import 'package:BatteryStatus/view/home/widgets/action_button.dart';
import 'package:BatteryStatus/view/home/widgets/charging_bar.dart';
import 'package:BatteryStatus/view/home/widgets/faq.dart';
import 'package:BatteryStatus/view/home/widgets/notification_bell.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const Spacer(flex: 15),
            Expanded(
                flex: 45,
                child: Row(
                  children: const [
                    Expanded(
                      flex: 4,
                      child: Faq(),
                    ),
                    Expanded(flex: 2, child: ChargingBar()),
                    Expanded(
                      flex: 4,
                      child: NotificationBell(),
                    )
                  ],
                )),
            const Spacer(
              flex: 12,
            ),
            Expanded(
              flex: 13,
              child: Row(
                children: const [
                  Spacer(
                    flex: 5,
                  ),
                  Expanded(flex: 25, child: ActionButton()),
                  Spacer(flex: 5)
                ],
              ),
            ),
            const Spacer(flex: 15)
          ],
        ));
  }
}
