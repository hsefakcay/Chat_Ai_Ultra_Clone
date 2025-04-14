import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../product/routes/app_router.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future<void> init(context) async {
    await Future.delayed(const Duration(seconds: 5));
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, AppRouter.onboarding);
    }
  }
}
