import 'package:BatteryStatus/view/home/widgets/action_button.dart';
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
    return Padding(padding: EdgeInsets.zero, child: Column(
      children: const [
         Spacer(flex:35),
         Expanded(child: ActionButton(),flex: 15,),
         Spacer(flex:20)
      ],
    ));
  }
}
