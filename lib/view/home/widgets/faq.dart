import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Faq extends HookConsumerWidget {
  const Faq({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usableHeight = MediaQuery.of(context).size.height;
    final usableWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      return IconButton(
        splashRadius: constraints.maxWidth * 0.3,
        icon: Icon(
          Icons.code,
          size: constraints.maxWidth * 0.3,
        ),
        style: IconButton.styleFrom(
            splashFactory: InkSparkle.splashFactory,
            fixedSize:
                Size(constraints.maxWidth * 0.6, constraints.maxWidth * 0.6),
            padding: EdgeInsets.zero,
            alignment: Alignment.center),
        onPressed: () {
          Flushbar(
            message: "Developed by github.com/devberkay",
            messageSize: usableWidth * 0.035,
            maxWidth: usableWidth * 0.75,
            borderRadius: BorderRadius.circular(usableHeight * 0.1),
            mainButton: TextButton(
                onPressed: () {
                  context.pop();
                },
                style:
                    TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
                child: Text("Dismiss",
                    style: TextStyle(
                        fontSize: usableWidth * 0.03,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
          ).show(context);
        },
        color: Colors.grey,
      );
    });
  }
}
