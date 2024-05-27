// time_conversion.dart

import 'package:intl/intl.dart';

class TimeConversion {
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  // Konversi waktu dari satu zona waktu ke yang lain
  static String convertTime(DateTime dateTime, String fromTimeZone, String toTimeZone) {
    Duration fromOffset = _getOffset(fromTimeZone);
    Duration toOffset = _getOffset(toTimeZone);

    DateTime convertedTime = dateTime.toUtc().add(toOffset - fromOffset);
    return _dateFormat.format(convertedTime.toLocal());
  }

  // Mendapatkan offset untuk setiap zona waktu
  static Duration _getOffset(String timeZone) {
    switch (timeZone) {
      case 'WIB':
        return Duration(hours: 7);
      case 'WITA':
        return Duration(hours: 8);
      case 'WIT':
        return Duration(hours: 9);
      default:
        throw ArgumentError('Invalid time zone');
    }
  }
}
