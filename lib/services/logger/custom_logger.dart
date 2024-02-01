import 'package:logger/logger.dart';

class CustomLogger {
  CustomLogger._();

  static late Logger logger;
  static late Logger loggerNoStack;

  static void init() {
    logger = Logger(
      printer: PrettyPrinter(),
    );

    loggerNoStack = Logger(
      printer: PrettyPrinter(methodCount: 0),
    );
  }
}
