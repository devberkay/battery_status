import 'dart:async';
import 'dart:math';

import 'package:BatteryStatus/model/provider/monitoring/monitoring_notifier.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final batteryNotifierProvider =
    StreamNotifierProvider.autoDispose<BatteryNotifier, int?>(
        BatteryNotifier.new);

class BatteryNotifier extends AutoDisposeStreamNotifier<int?> {
  @override
  Stream<int?> build() async* {
    yield* ref.watch(monitoringStateProvider).when(monitoring: (__) {
      return buildWithRealPercentage();
    }, idle: (__) {
      return buildWithRandomPercentage();
    });
  }

  Stream<int?> buildWithRealPercentage() async* {
    const platform = MethodChannel('berkaycan.dev/battery');
    try {
      yield* Stream.periodic(const Duration(milliseconds: 5000), (_) {
        return platform.invokeMethod('getBatteryLevel');
      }).asyncMap((event) async => await event);
    } catch (e) {
      ref.refresh(monitoringStateProvider);
    }
  }

  Stream<int> buildWithRandomPercentage() async* {
    yield* Stream.periodic(const Duration(milliseconds: 5000), (_) {
      return Random.secure().nextInt(101);
    });
  }
}
