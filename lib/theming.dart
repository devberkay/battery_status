import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Theming {
  static ThemeData get config => ThemeData(
        scaffoldBackgroundColor: Colors.black,
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.transparent),
      );
}
