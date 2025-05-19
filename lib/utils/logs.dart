// ignore_for_file: prefer_single_quotes

import 'dart:core';
import 'dart:developer';

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:logger/logger.dart';
import 'package:universal_platform/universal_platform.dart';

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

class CustomOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(debugPrint);
  }
}

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    colors: !UniversalPlatform.isIOS,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
  output: CustomOutput(),
);

/// Logging config
void printLog([dynamic rawData, DateTime? startTime, Level? level]) {
  if (foundation.kDebugMode) {
    var time = '';
    if (startTime != null) {
      final endTime = DateTime.now().difference(startTime);
      final icon = endTime.inMilliseconds > 2000
          ? '⌛️Slow-'
          : endTime.inMilliseconds > 1000
              ? '⏰Medium-'
              : '⚡️Fast-';
      time = '[$icon${endTime.inMilliseconds}ms]';
    }

    try {
      final data = '$rawData';
      final log = '$time${data.toString()}';

      /// print log for ios
      if (UniversalPlatform.isIOS) {
        debugPrint(log);
        return;
      }

      /// print log for android
      switch (level) {
        case Level.error:
          printError(log, StackTrace.empty);
          break;
        case Level.warning:
          logger.w(log, stackTrace: StackTrace.empty);
          break;
        case Level.info:
          logger.i(log, stackTrace: StackTrace.empty);
          break;
        case Level.debug:
          logger.d(log, stackTrace: StackTrace.empty);
          break;
        case Level.trace:
          logger.t(log, stackTrace: StackTrace.empty);
          break;
        default:
          if (time.startsWith('[⌛️Slow-')) {
            logger.f(log, stackTrace: StackTrace.empty);
            break;
          }
          if (time.startsWith('[⏰Medium-')) {
            logger.w(log, stackTrace: StackTrace.empty);
            break;
          }
          logger.t(log, stackTrace: StackTrace.empty);
          break;
      }
    } catch (err, trace) {
      printError(err, trace);
    }
  }
}

void printError(dynamic err, [dynamic trace, dynamic message]) {
  if (!foundation.kDebugMode) {
    return;
  }

  final shouldHide = trace == null || '$trace'.isEmpty || '$trace'.contains('package:inspireui');
  if (shouldHide) {
    logger.d(err, error: message, stackTrace: StackTrace.empty);
    return;
  }

  logger.e(err, error: message ?? 'Stack trace:', stackTrace: trace);
}
