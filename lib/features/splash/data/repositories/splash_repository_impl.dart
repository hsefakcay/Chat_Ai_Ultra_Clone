import '../../domain/repositories/splash_repository.dart';
import '../datasources/splash_remote_data_source.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashRemoteDataSource remoteDataSource;

  SplashRepositoryImpl(this.remoteDataSource);

  @override
  Future<bool> checkForceUpdate() async {
    return remoteDataSource.checkForceUpdate();
  }
}
