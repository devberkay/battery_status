import 'package:BatteryStatus/view/home/widgets/action_button.dart';
import 'package:BatteryStatus/view/home/widgets/charging_bar.dart';
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
            const Spacer(flex: 20),
            Expanded(
                flex: 32,
                child: Row(
                  children: const [
                    Spacer(
                      flex: 45,
                    ),
                    Expanded(flex: 10, child: ChargingBar()),
                    Spacer(flex: 45)
                  ],
                )),
            const Spacer(
              flex: 20,
            ),
            Expanded(
              flex: 8,
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
            const Spacer(flex: 20)
          ],
        ));
  }
}
