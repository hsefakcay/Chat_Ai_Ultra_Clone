import 'package:chat_ai_ultra_clone/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import '../../domain/entities/onboarding_entity.dart';
import '../../domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  const OnboardingRepositoryImpl({required this.localDataSource});

  @override
  Future<List<OnboardingEntity>> getOnboardingPages() async {
    final model = await localDataSource.getOnboardingPages();
    return model.toEntity();
  }

  @override
  Future<void> saveOnboardingCompleted() async {
    await localDataSource.saveOnboardingCompleted();
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    return localDataSource.isOnboardingCompleted();
  }
}
