extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  static DateTime today() {
    final current = DateTime.now();
    return DateTime(current.year, current.month, current.day);
  }

  DateTime get onlyDate => DateTime(year, month, day);
}
