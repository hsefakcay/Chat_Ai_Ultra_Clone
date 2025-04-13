import 'package:chat_ai_ultra_clone/core/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../core/constants/app_constants.dart';

class AppStart {
  const AppStart._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: AppConstants.envFile, isOptional: true);
    await di.init();
  }
}
