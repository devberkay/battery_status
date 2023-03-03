import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:BatteryStatus/model/provider/router/router.dart';
import 'package:BatteryStatus/theming.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(child: BatteryStatusApp()));
}

class BatteryStatusApp extends StatefulHookConsumerWidget {
  const BatteryStatusApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BatteryStatusAppState();
}

class _BatteryStatusAppState extends ConsumerState<BatteryStatusApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);

    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        backButtonDispatcher: router.backButtonDispatcher,
        theme: Theming.config,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
