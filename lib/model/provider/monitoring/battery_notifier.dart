import 'dart:async';
import 'dart:math';

import 'package:BatteryStatus/model/provider/monitoring/monitoring_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final batteryNotifierProvider =
    StreamNotifierProvider.autoDispose<BatteryNotifier, int?>(
        BatteryNotifier.new);

class BatteryNotifier extends AutoDisposeStreamNotifier<int?> {
  @override
  Stream<int?> build() async* {}

  Future<void> buildWithRealPercentage() async {
    // final response = await ref
    //     .read(monitoringNotifierProvider.notifier)
    //     .monitorBatteryLevel();
    final stream =
        Stream.periodic(const Duration(milliseconds: 5000), (counter) async {
      final res = await ref
          .read(monitoringNotifierProvider.notifier)
          .monitorBatteryLevel();
      return res;
    });

    await for (var realNumber in stream) {}
  }

  Future<void> buildWithRandomPercentage() async {
    state = const AsyncLoading();
    final stream =
        Stream.periodic(const Duration(milliseconds: 5000), (counter) {
      return Random.secure().nextInt(101);
    });
    await for (var randomNumber in stream) {
      state = AsyncData(randomNumber);
    }
    // ref.onDispose(() async {
    //   await sub.cancel();
    // });
  }
}
