import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Faq extends HookConsumerWidget {
  const Faq({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return IconButton(
        icon: Icon(
          Icons.code,
          size: constraints.maxWidth * 0.3,
        ),
        style: IconButton.styleFrom(
            fixedSize:
                Size(constraints.maxWidth * 0.6, constraints.maxWidth * 0.6),
            padding: EdgeInsets.zero,
            alignment: Alignment.center),
        onPressed: () {
          
        },
        color: Colors.grey,
      );
    });
  }
}
