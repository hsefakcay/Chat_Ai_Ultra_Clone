import '../repositories/splash_repository.dart';

class CheckForceUpdate {
  final SplashRepository repository;

  CheckForceUpdate(this.repository);

  Future<bool> call() async {
    return repository.checkForceUpdate();
  }
}
