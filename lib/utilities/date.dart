import 'package:intl/intl.dart';

extension DateFormatter on DateTime? {
  String toDateString() {
    final formmater = DateFormat('DD/MM/YYYY');
    final dateTime = this;

    return dateTime == null ? '-' : formmater.format(dateTime);
  }
}
