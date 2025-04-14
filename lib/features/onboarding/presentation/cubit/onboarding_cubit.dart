import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../product/routes/app_router.dart';
import '../../domain/usecases/get_onboarding_pages.dart';
import '../../domain/usecases/save_onboarding_completed.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final GetOnboardingPages getOnboardingPages;
  final SaveOnboardingCompleted saveOnboardingCompleted;

  OnboardingCubit({required this.getOnboardingPages, required this.saveOnboardingCompleted})
    : super(const OnboardingState()) {
    loadOnboardingPages();
  }

  Future<void> loadOnboardingPages() async {
    try {
      emit(state.copyWith(status: OnboardingStatus.loading));
      final pages = await getOnboardingPages();
      emit(state.copyWith(status: OnboardingStatus.loaded, pages: pages, isLastPage: false));
    } catch (e) {
      emit(state.copyWith(status: OnboardingStatus.error, errorMessage: e.toString()));
    }
  }

  void updatePage(int index) {
    emit(state.copyWith(currentPage: index, isLastPage: index == state.pages.length - 1));
  }

  Future<void> onNextPage(BuildContext context) async {
    if (state.currentPage < state.pages.length - 1) {
      updatePage(state.currentPage + 1);
    } else {
      await saveOnboardingCompleted();
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRouter.chat);
      }
    }
  }
}
