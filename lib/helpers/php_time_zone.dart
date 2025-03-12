Map<String, String> timezoneMap = {
  "EET": "Africa/Cairo",
  "PST": "America/Los_Angeles",
  "IST": "Asia/Kolkata",
  "CET": "Europe/Paris",
  "GMT": "Europe/London",
  "AST": "Asia/Riyadh",
  "MSK": "Europe/Moscow",
  // Add more if needed...
};

String getPHPTimezone() {
  String flutterTimezone = DateTime.now().timeZoneName;
  return timezoneMap[flutterTimezone] ?? "UTC"; // Default to UTC if not found
}
