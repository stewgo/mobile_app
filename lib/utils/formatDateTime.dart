import 'package:intl/intl.dart';

String formatDateTime(String dateTime) {
  return new DateFormat.yMd().add_jm().format(DateTime.parse(dateTime));
}