import 'dart:async';
import 'dart:math';

import 'package:BatteryStatus/model/provider/monitoring/monitoring_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final batteryNotifierProvider =
    StreamNotifierProvider.autoDispose<BatteryNotifier, int?>(
        BatteryNotifier.new);

class BatteryNotifier extends AutoDisposeStreamNotifier<int?> {
  @override
  Stream<int?> build() async* {
    yield* ref.watch(monitoringNotifierProvider).when(
        monitoring: (_, __) {
          return buildWithRealPercentage();
        },
        idle: (__) {
          return buildWithRandomPercentage();
        });
  }

  Stream<int?> buildWithRealPercentage() async* {
    yield* Stream.periodic(const Duration(milliseconds: 5000), (_) {
      return ref
          .read(monitoringNotifierProvider.notifier)
          .monitorBatteryLevel();
    }).asyncMap((event) async => await event);
  }

  Stream<int> buildWithRandomPercentage() async* {
    yield* Stream.periodic(const Duration(milliseconds: 5000), (_) {
      return Random.secure().nextInt(101);
    });
  }
}
