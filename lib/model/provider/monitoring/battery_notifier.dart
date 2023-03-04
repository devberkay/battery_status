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
    final isMonitoring = ref.watch(monitoringNotifierProvider).when(
        monitoring: (batteryPercentage, msg) {
      return true;
    }, idle: (msg) {
      return false;
    });

    if (isMonitoring) {
      await for (var element in buildWithRealPercentage()) {
        yield element;
      }
    } else {
      await for (var element in buildWithRandomPercentage()) {
        yield element;
      }
    }
  }

  Stream<int> buildWithRealPercentage() async* {
    final periodicStream =
        Stream.periodic(const Duration(milliseconds: 5000), (counter) async* {
      yield await ref
          .read(monitoringNotifierProvider.notifier)
          .monitorBatteryLevel();
    });
    await for (var streamController in periodicStream) {
      await for (var randomInt in streamController) {
        if (randomInt != null) {
          yield randomInt;
        } else {
          ref.refresh(monitoringNotifierProvider);
          // ref.invalidate(monitoringNotifierProvider);
          // ref.invalidateSelf();
        }
      }
    }
  }

  Stream<int> buildWithRandomPercentage() async* {
    final streamSub =
        Stream.periodic(const Duration(milliseconds: 5000), (counter) async* {
      yield Random.secure().nextInt(101);
    }).listen((event) {
      
    });
  }
}
