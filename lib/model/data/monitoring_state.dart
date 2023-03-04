import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_state.freezed.dart';

@freezed
class MonitoringState with _$MonitoringState {
  const factory MonitoringState.white(String? letter) = White;
  const factory MonitoringState.grey(String letter) = Grey;
  const factory MonitoringState.yellow(String letter) = Yellow;
  const factory MonitoringState.green(String letter) = Green;
  
  
}