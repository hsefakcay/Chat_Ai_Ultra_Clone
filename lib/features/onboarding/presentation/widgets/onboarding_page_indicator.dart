import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';
import '../cubit/onboarding_state.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final OnboardingState state;

  const OnboardingPageIndicator({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          state.pages.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: MediaQuery.sizeOf(context).width * 0.15,
            decoration: BoxDecoration(
              color: state.currentPage == index ? ColorConstants.primary : ColorConstants.darkGrey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
