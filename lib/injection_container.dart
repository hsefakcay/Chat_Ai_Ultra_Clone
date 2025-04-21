import 'package:get_it/get_it.dart';
import 'features/discover/data/repositories/discover_repository_impl.dart';
import 'features/discover/domain/repositories/discover_repository.dart';
import 'features/discover/domain/usecases/get_official_models.dart';
import 'features/discover/domain/usecases/get_ai_tools.dart';
import 'features/discover/domain/usecases/get_experts.dart';
import 'features/discover/presentation/bloc/discover_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(
    () => DiscoverBloc(getOfficialModels: sl(), getAITools: sl(), getExperts: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetOfficialModels(sl()));
  sl.registerLazySingleton(() => GetAITools(sl()));
  sl.registerLazySingleton(() => GetExperts(sl()));

  // Repository
  sl.registerLazySingleton<DiscoverRepository>(() => DiscoverRepositoryImpl());
}
