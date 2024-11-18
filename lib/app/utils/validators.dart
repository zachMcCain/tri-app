  
import 'package:tri/app/utils/utils.dart';

class Validators {
  static String? notEmpty(value) {
    if (value == null || value.isEmpty) {
      return 'Value required';
    }
    return null;
  }

  static String? isNumber(value) {
    if (Utils.isNumeric(value)) {
      return null;
    }
    return "Must be a numeric value";
  }

  static String? notNull(value) {
    if (value == null) {
      return 'Value required';
    }
    return null;
  }
}