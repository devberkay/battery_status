import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_state.freezed.dart';

@freezed
class MonitoringState with _$MonitoringState {
  const factory MonitoringState.success(int battery, [String? msg]) =
      Success;
  const factory MonitoringState.fail(String msg) = Fail;
}
