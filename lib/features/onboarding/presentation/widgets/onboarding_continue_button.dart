import 'package:flutter/material.dart';
import '../../../../core/constants/string_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/onboarding_state.dart';
import '../cubit/onboarding_cubit.dart';

class OnboardingContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnboardingContinueButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final bool isLastPage = state.currentPage == state.pages.length - 1;

        return ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 6),
              Center(
                child: Padding(
                  padding: isLastPage ? EdgeInsets.all(16) : EdgeInsets.all(14.0),
                  child: Text(
                    isLastPage ? StringConstants.tryFree : StringConstants.onboardingContinueButton,
                    style:
                        isLastPage
                            ? Theme.of(context).textTheme.headlineMedium
                            : Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward),
            ],
          ),
        );
      },
    );
  }
}
