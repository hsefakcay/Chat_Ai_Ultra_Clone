import 'package:get_it/get_it.dart';
import '../features/chat/data/datasources/chat_remote_data_source.dart';
import '../features/chat/data/repositories/chat_repository_impl.dart';
import '../features/chat/domain/repositories/chat_repository.dart';
import '../features/chat/domain/usecases/send_message.dart';
import '../features/chat/presentation/cubit/chat_cubit.dart';
import '../features/splash/data/datasources/splash_remote_data_source.dart';
import '../features/splash/data/repositories/splash_repository_impl.dart';
import '../features/splash/domain/repositories/splash_repository.dart';
import '../features/splash/domain/usecases/check_force_update.dart';
import '../features/splash/presentation/bloc/splash_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => SplashBloc(checkForceUpdate: sl()));

  // Cubits
  sl.registerFactory(() => ChatCubit(sendMessage: sl()));

  // Use cases
  sl.registerLazySingleton(() => SendMessage(sl()));
  sl.registerLazySingleton(() => CheckForceUpdate(sl()));

  // Repositories
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl()));
  sl.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<ChatRemoteDataSource>(() => ChatRemoteDataSourceImpl());
  sl.registerLazySingleton<SplashRemoteDataSource>(() => SplashRemoteDataSourceImpl());
}
