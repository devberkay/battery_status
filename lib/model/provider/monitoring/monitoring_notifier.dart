import 'package:BatteryStatus/model/data/monitoring_state.dart';
import 'package:BatteryStatus/view/home/widgets/action_button.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final monitoringStateProvider = StateProvider.autoDispose<MonitoringState>((ref) {
  return const MonitoringState.idle();
});
