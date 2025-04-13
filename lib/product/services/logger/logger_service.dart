import 'package:logger/logger.dart';

class LoggerService {
  final Logger _logger;

  LoggerService() : _logger = Logger();

  void debug(dynamic message) {
    _logger.d(message);
  }

  void info(dynamic message) {
    _logger.i(message);
  }

  void warning(dynamic message) {
    _logger.w(message);
  }

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
