import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_state.freezed.dart';

@freezed
class MonitoringState with _$MonitoringState {
  const factory MonitoringState.monitoring([String? msg]) =
      Monitoring;
  const factory MonitoringState.idle([String? msg]) = Idle;
}
