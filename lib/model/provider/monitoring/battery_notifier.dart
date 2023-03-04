import 'dart:async';
import 'dart:math';

import 'package:BatteryStatus/model/provider/monitoring/monitoring_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final batteryNotifierProvider =
    StreamNotifierProvider.autoDispose<BatteryNotifier, int>(
        BatteryNotifier.new);

class BatteryNotifier extends AutoDisposeStreamNotifier<int> {
  late final StreamSubscription streamSub;
  @override
  Stream<int> build() async* {
    ref.onDispose(() async {
      await streamSub.cancel();
    });
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
    while (true) {
      final response = await ref
          .read(monitoringNotifierProvider.notifier)
          .monitorBatteryLevel();
      if (response != null) {
        yield response;
      } else {
        
      }
      await Future.delayed(const Duration(milliseconds: 5000));
    }
  }

  Stream<int> buildWithRandomPercentage() async* {
    while (true) {
      yield Random.secure().nextInt(101);
      await Future.delayed(const Duration(milliseconds: 5000));
    }
  }
}
