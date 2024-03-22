class DefaultValue {
  static const int defaultPort = 27124;
  static const String authorizationHeaderPrefix = "Bearer ";
  static const List<String> defaultCategory = [
    "[[食品]]",
    "[[娯楽]]",
    "[[車]]",
    "[[外食]]",
    "[[日用]]",
    "[[温泉]]",
  ];
  static const List<String> defaultMethod = [
    "[[現金]]",
    "[[クレジットカード]]",
    "[[その他]]",
  ];
  static const String defaultRootPath = "";
  static const String defaultBodyTemplate = "{{place}}\n{{date}}\n{{week}}\n{{category}}\n{{price}}\n{{method}}\n{{other";
  static const String defaultTitleTemplate = "{{place}}_YYYYMMDD";
}
