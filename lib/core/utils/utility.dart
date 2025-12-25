import 'dart:developer' as developer_log;

import 'package:flutter/foundation.dart';

class Utility {
  static void showPrints({required String message}) {
    if (kDebugMode) {
      developer_log.log(message);
    }
  }
}
