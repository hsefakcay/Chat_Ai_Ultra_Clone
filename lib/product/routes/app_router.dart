import 'package:chat_ai_ultra_clone/features/main/main_page.dart';
import 'package:chat_ai_ultra_clone/features/onboarding/presentation/view/onboarding_view_mixin.dart';
import 'package:flutter/material.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  const AppRouter._();

  static const String chat = '/chat';
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatPage());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case home:
        return MaterialPageRoute(builder: (_) => const MainPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }
}
