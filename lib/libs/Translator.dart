import 'package:timeago/timeago.dart';

class Translator implements LookupMessages {
  @override
  String aDay(int hours) {
    return 'یک روز قبل';
  }

  @override
  String aboutAMinute(int minutes) {
    return 'یک دقیقه قبل';
  }

  @override
  String aboutAMonth(int days) {
    return 'حدود یک ماه قبل';
  }

  @override
  String aboutAYear(int year) {
    return 'حدود یک سال قبل';
  }

  @override
  String aboutAnHour(int minutes) {
    return 'حدود یک ساعت قبل';
  }

  @override
  String days(int days) {
    return '$days روز قبل';
  }

  @override
  String hours(int hours) {
    return '$hours ساعت قبل';
  }

  @override
  String lessThanOneMinute(int seconds) {
  return 'لحظاتی قبل';
  }

  @override
  String minutes(int minutes) {
  return '$minutes دقیقه قبل';
  }

  @override
  String months(int months) {
    return '$months ماه قبل';
  }

  @override
  String prefixAgo() {
    return ''; // در فارسی نیازی به تعریف این قسمت نداریم
  }

  @override
  String prefixFromNow() {
    return 'ثبت شده در ';
  }

  @override
  String suffixAgo() {
    return '';
  }

  @override
  String suffixFromNow() {
    return '';
  }

  @override
  String years(int years) {
   return '$years سال قبل';
  }
  
  @override
  String wordSeparator() {
   return '';
  }

}
