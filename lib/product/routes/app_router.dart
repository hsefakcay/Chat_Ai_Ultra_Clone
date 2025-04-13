import 'package:flutter/material.dart';
import '../../features/chat/presentation/pages/chat_page.dart';

class AppRouter {
  const AppRouter._();

  static const String initial = '/';
  static const String chat = '/chat';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }
}
