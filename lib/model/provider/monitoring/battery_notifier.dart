import 'dart:async';
import 'dart:math';

import 'package:BatteryStatus/model/provider/monitoring/monitoring_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final batteryNotifierProvider =
    StreamNotifierProvider.autoDispose<BatteryNotifier, int>(
        BatteryNotifier.new);

class BatteryNotifier extends AutoDisposeStreamNotifier<int> {
  @override
  Stream<int> build() async* {
    ref.watch(monitoringNotifierProvider).when(
        monitoring: (batteryPercentage, msg) async* {
      yield buildWithRealPercentage();
    }, idle: (msg) async*{
      yield buildWithRandomPercentage();
    });
  }

  Stream<int> buildWithRealPercentage() async* {
    final periodicStream =
        Stream.periodic(const Duration(milliseconds: 5000), (counter) async* {
      yield await ref
          .read(monitoringNotifierProvider.notifier)
          .monitorBatteryLevel(ref);
    });
    await for (var streamController in periodicStream) {
      await for (var randomInt in streamController) {
        if (randomInt != null) {
          yield randomInt;
        } else {
          ref.invalidate(monitoringNotifierProvider);
          ref.invalidateSelf();
        }
      }
    }
  }

  Stream<int> buildWithRandomPercentage() async* {
    final periodicStream =
        Stream.periodic(const Duration(milliseconds: 5000), (counter) async* {
      yield Random.secure().nextInt(101);
    });
    await for (var streamController in periodicStream) {
      await for (var randomInt in streamController) {
        yield randomInt;
      }
    }
  }
}
