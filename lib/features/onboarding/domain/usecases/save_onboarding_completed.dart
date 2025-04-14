import '../repositories/onboarding_repository.dart';

class SaveOnboardingCompleted {
  final OnboardingRepository repository;

  SaveOnboardingCompleted(this.repository);

  Future<void> call() {
    return repository.saveOnboardingCompleted();
  }
}
