// ignore_for_file: prefer_single_quotes

import 'dart:developer';

class LoggerDebug {
  LoggerDebug({this.headColor = '', this.constTitle});
  String headColor;
  String? constTitle;

  void black(String message, [String? title]) {
    return log(
      "${LogColors.black}$message${LogColors.reset}",
      name: "${LogColors.blue}$headColor${title ?? constTitle ?? ""}${LogColors.reset}",
      level: 2000,
    );
  }

  void white(String message, [String? title]) {
    return log(
      "${LogColors.white}$message${LogColors.reset}",
      name: "${LogColors.blue}$headColor${title ?? constTitle ?? ""}${LogColors.reset}",
      level: 2000,
    );
  }

  void red(String message, [String? title]) {
    return log(
      "${LogColors.red}$message${LogColors.reset}",
      name: "${LogColors.blue}$headColor${title ?? constTitle ?? ""}${LogColors.reset}",
      level: 2000,
    );
  }

  void green(String message, [String? title]) {
    return log(
      "${LogColors.green}$message${LogColors.reset}",
      name: "${LogColors.blue}$headColor${title ?? constTitle ?? ""}${LogColors.reset}",
      level: 2000,
    );
  }

  void yellow(String message, [String? title]) {
    return log(
      "${LogColors.yellow}$message${LogColors.reset}",
      name: "${LogColors.blue}$headColor${title ?? constTitle ?? ""}${LogColors.reset}",
      level: 2000,
    );
  }

  void blue(String message, [String? title]) {
    return log(
      "${LogColors.blue}$message${LogColors.reset}",
      name: "${LogColors.blue}$headColor${title ?? constTitle ?? ""}${LogColors.reset}",
      level: 2000,
    );
  }

  void cyan(String message, [String? title]) {
    return log(
      "${LogColors.cyan}$message${LogColors.reset}",
      name: "${LogColors.blue}$headColor${title ?? constTitle ?? ""}${LogColors.reset}",
      level: 2000,
    );
  }
}

class LogColors {
  static String reset = '\x1B[0m';
  static String black = '\x1B[30m';
  static String white = '\x1B[37m';
  static String red = '\x1B[31m';
  static String green = '\x1B[32m';
  static String yellow = '\x1B[33m';
  static String blue = '\x1B[34m';
  static String cyan = '\x1B[36m';
}
