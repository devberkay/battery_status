import 'package:BatteryStatus/model/data/monitoring_state.dart';
import 'package:BatteryStatus/view/home/widgets/action_button.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final monitoringNotifierProvider =
    NotifierProvider<MonitoringNotifier, MonitoringState>(
        MonitoringNotifier.new);

class MonitoringNotifier extends Notifier<MonitoringState> {
  @override
  build() {
    return const MonitoringState.idle();
  }

  Future<int?> monitorBatteryLevel(Ref ref) async {
    const platform = MethodChannel('berkaycan.dev/battery');
    try {
      final batteryPercentage =
          await platform.invokeMethod('getBatteryLevel') as int;
      // ref.read(isMonitoringProvider.notifier).state = true;
      state = MonitoringState.monitoring(
          batteryPercentage, "Current battery is $batteryPercentage%");
      return batteryPercentage;
    } on PlatformException catch (e) {
      // ref.read(isMonitoringProvider.notifier).state = false;
      state = MonitoringState.idle(
          e.message ?? "Battery can't be monitored at the moment");
      
    }
  }
}
