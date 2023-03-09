import 'package:intl/intl.dart';

String rewriteDate(String dateNews){

  final dateFormatter = DateFormat('dd/MM/yyyy H:m:s');
  return dateFormatter.format(DateTime.parse(dateNews));
}