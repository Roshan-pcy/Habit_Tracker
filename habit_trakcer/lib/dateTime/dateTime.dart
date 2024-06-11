String totdaysDateFormatted() {
  var dateTimeObject = DateTime.now();
  String year = dateTimeObject.year.toString();

  String month = dateTimeObject.month.toString();

  if (month.length == 1) {
    month = "0$month";
  }
  String day = dateTimeObject.month.toString();

  if (day.length == 1) {
    day = "0$day";
  }
  String yyymmdd = year + month + day;
  return yyymmdd;
}

DateTime createDateTimeObject(String yyymmdd) {
  int yyy = int.parse(yyymmdd.substring(0, 4));
  int mm = int.parse(yyymmdd.substring(4, 6));
  int dd = int.parse(yyymmdd.substring(6, 8));

  return DateTime(yyy, mm, dd);
}

String convertDateTimeToString(DateTime dateTime) {
  String year = dateTime.year.toString();

  String month = dateTime.month.toString();

  if (month.length == 1) {
    month = "0$month";
  }
  String day = dateTime.month.toString();

  if (day.length == 1) {
    day = "0$day";
  }
  String yyymmdd = year + month + day;
  return yyymmdd;
}
