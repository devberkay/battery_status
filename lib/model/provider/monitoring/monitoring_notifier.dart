import 'package:BatteryStatus/model/data/monitoring_state.dart';
import 'package:BatteryStatus/view/home/widgets/action_button.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonitoringNotifier extends Notifier<MonitoringState> {
  @override
   build() {
    return MonitoringState.idle();
  }

  

  Future<MonitoringState> _monitorBatteryLevel(WidgetRef ref) async {
    const platform = MethodChannel('berkaycan.dev/battery');
    try {
      final batteryPercentage = await platform.invokeMethod('getBatteryLevel');
      ref.read(isMonitoringProvider.notifier).state =
               true;
      return MonitoringState.monitoring(
          batteryPercentage, "Current battery is $batteryPercentage");
      
    } on PlatformException catch (e) {
      ref.read(isMonitoringProvider.notifier).state =
                false;
      return MonitoringState.idle("Battery can't be monitored at the moment");
    }
  }
}