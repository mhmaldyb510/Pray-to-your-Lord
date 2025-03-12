String convertToAmPm(String time) {
  List<String> parts = time.split(":");
  int hour = int.parse(parts[0]);

  String period = hour >= 12 ? "PM" : "AM";
  int formattedHour = hour % 12 == 0 ? 12 : hour % 12;

  return "$formattedHour:${parts[1]} $period";
}
