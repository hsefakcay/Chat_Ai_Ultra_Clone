
import 'package:chat_ai_ultra_clone/features/onboarding/domain/entities/onboarding_entity.dart';

abstract class OnboardingRepository {
  Future<List<OnboardingEntity>> getOnboardingPages();
  Future<void> saveOnboardingCompleted();
  Future<bool> isOnboardingCompleted();
}
