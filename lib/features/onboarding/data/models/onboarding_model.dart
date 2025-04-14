import '../../domain/entities/onboarding_entity.dart';
import '../../domain/entities/models/feature_item.dart';
import '../../domain/entities/models/review_item.dart';
import '../../domain/entities/models/pricing_item.dart';

class OnboardingModel {
  final List<Map<String, dynamic>> pages;

  const OnboardingModel({required this.pages});

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(pages: List<Map<String, dynamic>>.from(json['pages'] as List));
  }

  List<OnboardingEntity> toEntity() {
    return pages.map((page) {
      final String type = page['type'] as String;
      switch (type) {
        case 'welcome':
          return WelcomePageEntity(
            title: page['title'] as String,
            description: page['description'] as String?,
            imagePath: page['imagePath'] as String,
          );
        case 'features':
          return FeaturesPageEntity(
            title: page['title'] as String,
            features:
                (page['features'] as List)
                    .map(
                      (feature) => FeatureItem(
                        title: feature['title'] as String,
                        iconPath: feature['iconPath'] as String,
                      ),
                    )
                    .toList(),
          );
        case 'reviews':
          return ReviewsPageEntity(
            title: page['title'] as String,
            reviews:
                (page['reviews'] as List)
                    .map(
                      (review) => ReviewItem(
                        title: review['title'] as String,
                        description: review['description'] as String,
                        stars: review['stars'] as int,
                      ),
                    )
                    .toList(),
          );
        case 'pricing':
          return PricingPageEntity(
            title: page['title'] as String,
            description: page['description'] as String?,
            features:
                (page['features'] as List)
                    .map(
                      (feature) => FeatureItem(
                        title: feature['title'] as String,
                        iconPath: feature['iconPath'] as String,
                      ),
                    )
                    .toList(),
            pricingItems:
                (page['pricingItems'] as List)
                    .map(
                      (item) => PricingItem(
                        title: item['title'] as String,
                        price: item['price'] as String,
                        subtitle: item['subtitle'] as String?,
                        isHighlighted: item['isHighlighted'] as bool? ?? false,
                      ),
                    )
                    .toList(),
          );
        default:
          throw Exception('Unknown page type: $type');
      }
    }).toList();
  }
}
