import 'package:get_it/get_it.dart';
import '../features/chat/data/datasources/chat_remote_data_source.dart';
import '../features/chat/data/repositories/chat_repository_impl.dart';
import '../features/chat/domain/repositories/chat_repository.dart';
import '../features/chat/domain/usecases/send_message.dart';
import '../features/chat/presentation/cubit/chat_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(() => ChatCubit(sendMessage: sl()));

  // Use cases
  sl.registerLazySingleton(() => SendMessage(sl()));

  // Repositories
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<ChatRemoteDataSource>(() => ChatRemoteDataSourceImpl());
}
