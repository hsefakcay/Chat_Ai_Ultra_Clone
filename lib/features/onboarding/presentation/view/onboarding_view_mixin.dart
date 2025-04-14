import 'package:chat_ai_ultra_clone/core/di/injection_container.dart';
import 'package:chat_ai_ultra_clone/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:chat_ai_ultra_clone/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin PageControllerMixin<T extends StatefulWidget> on State<T> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page);

  Future<void> nextPage() async {
    await pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(getOnboardingPages: sl(), saveOnboardingCompleted: sl()),
      child: const OnboardingPage(),
    );
  }
}
