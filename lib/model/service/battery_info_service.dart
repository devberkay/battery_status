import 'dart:async';

import 'package:flutter/services.dart';

class BatteryInfo {
  static const MethodChannel _channel =
      const MethodChannel('berkaycan.dev/battery');

  static Future<int> get batteryLevel async {
    final int level = await _channel.invokeMethod('getBatteryLevel');
    return level;
  }

  
}
