import 'package:intl/intl.dart';

extension DateTimeX on DateTime{
  static DateFormat formatter = DateFormat('yyyy-MM-dd');

  String readAbleFormat(){
    return formatter.format(this);
  }
  }
