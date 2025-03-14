import 'package:flutter/services.dart';

class GestureServices {
  static onTapWithHaptic(Function function) {
    HapticFeedback.lightImpact();
    function();
  }
}
