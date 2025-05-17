class DateTimeParser {
  static DateTime? parseDate(String? date) {
    if (date == null || date.trim().isEmpty) return null;
    return DateTime.tryParse(date);
  }
}
