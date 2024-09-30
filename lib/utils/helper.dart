import 'package:intl/intl.dart';

abstract class Helper {
  static String formatDateV1(DateTime date) {
    DateFormat dateFormat = DateFormat('EEE, MMM dd');
    return dateFormat.format(date);
  }

  static String formatDateV2(DateTime date) {
    DateFormat dateFormat = DateFormat('EEE, MMMM dd');
    return dateFormat.format(date);
  }

  static String formatTime(DateTime time) {
    DateFormat timeFormat = DateFormat.Hm();
    return timeFormat.format(time);
  }
}
