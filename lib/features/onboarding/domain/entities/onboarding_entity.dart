import 'package:equatable/equatable.dart';
import 'models/feature_item.dart';
import 'models/review_item.dart';
import 'models/pricing_item.dart';

abstract class OnboardingEntity extends Equatable {
  final String title;
  final String? description;

  const OnboardingEntity({required this.title, this.description});

  @override
  List<Object?> get props => [title, description];
}

class WelcomePageEntity extends OnboardingEntity {
  final String imagePath;

  const WelcomePageEntity({
    required super.title,
    required super.description,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [...super.props, imagePath];
}

class FeaturesPageEntity extends OnboardingEntity {
  final List<FeatureItem> features;

  const FeaturesPageEntity({required super.title, required this.features});

  @override
  List<Object?> get props => [...super.props, features];
}

class ReviewsPageEntity extends OnboardingEntity {
  final List<ReviewItem> reviews;

  const ReviewsPageEntity({required super.title, required this.reviews});

  @override
  List<Object?> get props => [...super.props, reviews];
}

class PricingPageEntity extends OnboardingEntity {
  final List<FeatureItem> features;
  final List<PricingItem> pricingItems;

  const PricingPageEntity({
    required super.title,
    super.description,
    required this.features,
    required this.pricingItems,
  });

  @override
  List<Object?> get props => [...super.props, features, pricingItems];
}
