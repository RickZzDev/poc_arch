import 'dart:io';

abstract class HeaderUtils {
  static Map<String, dynamic> defaultHeader() => {
        "SO": Platform.isAndroid ? "Android" : "IOS",
        "Content-Type": "application/json",
      };

  static Map<String, dynamic> authenticatedHeader() => {
        "SO": Platform.isAndroid ? "Android" : "IOS",
        "Content-Type": "application/json",
      };
}
