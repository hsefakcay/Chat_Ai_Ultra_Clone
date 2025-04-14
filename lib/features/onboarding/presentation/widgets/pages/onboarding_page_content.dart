import 'package:flutter/material.dart';
import '../../../domain/entities/onboarding_entity.dart';
import 'welcome_page.dart';
import 'features_page.dart';
import 'reviews_page.dart';
import 'pricing_page.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingEntity model;

  const OnboardingPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    if (model is WelcomePageEntity) {
      return WelcomePage(model: model as WelcomePageEntity);
    } else if (model is FeaturesPageEntity) {
      return FeaturesPage(model: model as FeaturesPageEntity);
    } else if (model is ReviewsPageEntity) {
      return ReviewsPage(model: model as ReviewsPageEntity);
    } else if (model is PricingPageEntity) {
      return PricingPage(model: model as PricingPageEntity);
    }

    return const SizedBox.shrink();
  }
}
