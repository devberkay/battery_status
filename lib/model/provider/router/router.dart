import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:BatteryStatus/view/home/home_page.dart';
import 'package:BatteryStatus/view/shared_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  final platform = Platform.isAndroid;
  return GoRouter(initialLocation: "/", navigatorKey: _rootNavigator, routes: [
    ShellRoute(
        navigatorKey: _shellNavigator,
        pageBuilder: ((context, state, child) {
          return platform
              ? MaterialPage(
                  key: state.pageKey,
                  child: SharedScaffold(
                    key: state.pageKey,
                    routerState: state,
                    child: child,
                  ))
              : CupertinoPage(
                  key: state.pageKey,
                  child: SharedScaffold(
                    key: state.pageKey,
                    routerState: state,
                    child: child,
                  ));
        }),
        routes: [
          GoRoute(
            path: "/",
            pageBuilder: (context, state) => platform
                ? MaterialPage(
                    key: state.pageKey,
                    child: HomePage(
                      key: state.pageKey,
                    ))
                : CupertinoPage(
                    key: state.pageKey,
                    child: HomePage(
                      key: state.pageKey,
                    )),
          ),
        ])
  ]);
});
