import 'package:chat_ai_ultra_clone/features/chat_history/data/datasources/chat_local_data_source.dart';
import 'package:chat_ai_ultra_clone/features/chat_history/domain/repositories/chat_repository.dart';
import 'package:chat_ai_ultra_clone/features/chat_history/data/repositories/chat_repository_impl.dart';
import 'package:chat_ai_ultra_clone/features/chat_history/domain/usecases/get_chats_usecase.dart';
import 'package:chat_ai_ultra_clone/features/chat_history/presentation/bloc/chat_history_bloc.dart';
import 'package:chat_ai_ultra_clone/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/chat/data/datasources/chat_remote_data_source.dart';
import '../../features/chat/data/repositories/chat_repository_impl.dart';
import '../../features/chat/domain/repositories/chat_repository.dart';
import '../../features/chat/domain/usecases/send_message.dart';
import '../../features/chat/presentation/cubit/chat_cubit.dart';
import '../../features/splash/data/datasources/splash_remote_data_source.dart';
import '../../features/splash/data/repositories/splash_repository_impl.dart';
import '../../features/splash/domain/repositories/splash_repository.dart';
import '../../features/splash/domain/usecases/check_force_update.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/onboarding/data/repositories/onboarding_repository_impl.dart';
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../../features/onboarding/domain/usecases/get_onboarding_pages.dart';
import '../../features/onboarding/domain/usecases/save_onboarding_completed.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../../features/discover/data/repositories/discover_repository_impl.dart';
import '../../features/discover/domain/repositories/discover_repository.dart';
import '../../features/discover/domain/usecases/get_official_models.dart';
import '../../features/discover/domain/usecases/get_ai_tools.dart';
import '../../features/discover/domain/usecases/get_experts.dart';
import '../../features/discover/presentation/bloc/discover_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Features - Splash
  sl.registerFactory(() => SplashBloc(checkForceUpdate: sl()));
  sl.registerLazySingleton(() => CheckForceUpdate(sl()));
  sl.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(sl()));
  sl.registerLazySingleton<SplashRemoteDataSource>(() => SplashRemoteDataSourceImpl());

  // Features - Chat
  sl.registerFactory(() => ChatCubit(sendMessage: sl()));
  sl.registerLazySingleton(() => SendMessage(sl()));
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl()));
  sl.registerLazySingleton<ChatRemoteDataSource>(() => ChatRemoteDataSourceImpl());

  // Features - Onboarding
  sl.registerFactory(
    () => OnboardingCubit(getOnboardingPages: sl(), saveOnboardingCompleted: sl()),
  );
  sl.registerLazySingleton(() => GetOnboardingPages(sl()));
  sl.registerLazySingleton(() => SaveOnboardingCompleted(sl()));
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Features - Chat History
  sl.registerFactory(() => ChatHistoryBloc(getChatsUseCase: sl()));
  sl.registerLazySingleton(() => GetChatsUseCase(sl()));
  sl.registerLazySingleton<ChatHistoryRepository>(() => ChatHistoryRepositoryImpl(sl()));
  sl.registerLazySingleton<ChatLocalDataSource>(() => ChatLocalDataSourceImpl());

  // Features - Discover
  sl.registerFactory(
    () => DiscoverBloc(getOfficialModels: sl(), getAITools: sl(), getExperts: sl()),
  );
  sl.registerLazySingleton(() => GetOfficialModels(sl()));
  sl.registerLazySingleton(() => GetAITools(sl()));
  sl.registerLazySingleton(() => GetExperts(sl()));
  sl.registerLazySingleton<DiscoverRepository>(() => DiscoverRepositoryImpl());
}
