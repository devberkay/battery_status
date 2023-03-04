import 'dart:async';
import 'dart:math';

import 'package:BatteryStatus/model/provider/monitoring/monitoring_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final batteryNotifierProvider =
    StreamNotifierProvider<BatteryNotifier, int>(BatteryNotifier.new);

class BatteryNotifier extends StreamNotifier<int> {
  @override
  Stream<int> build() async* {
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
}
