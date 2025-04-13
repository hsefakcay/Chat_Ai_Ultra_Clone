import 'package:flutter/material.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  const AppRouter._();

  static const String chat = '/chat';
  static const String splash = '/splash';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }
}
