import 'dart:developer' as dev;
extension CustomExtensions on dynamic{
 void get logPrint {
    dev.log(this);
  }
}
