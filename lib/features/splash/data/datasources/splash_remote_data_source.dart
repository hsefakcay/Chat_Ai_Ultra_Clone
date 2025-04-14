abstract class SplashRemoteDataSource {
  Future<bool> checkForceUpdate();
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  @override
  Future<bool> checkForceUpdate() async {
    // Simüle edilmiş API çağrısı
    await Future.delayed(const Duration(seconds: 3));
    return false; // Şimdilik force update gerekmediğini varsayalım
  }
}
