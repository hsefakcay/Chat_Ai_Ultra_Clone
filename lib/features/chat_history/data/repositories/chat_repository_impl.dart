import '../../domain/entities/chat.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_local_data_source.dart';

class ChatHistoryRepositoryImpl implements ChatHistoryRepository {
  final ChatLocalDataSource localDataSource;

  ChatHistoryRepositoryImpl(this.localDataSource);

  @override
  Future<List<Chat>> getAllChats() async {
    return await localDataSource.getAllChats();
  }

  @override
  Future<List<Chat>> getStarredChats() async {
    return await localDataSource.getStarredChats();
  }

  @override
  Future<void> starChat(String chatId) async {
    await localDataSource.starChat(chatId);
  }

  @override
  Future<void> unstarChat(String chatId) async {
    await localDataSource.unstarChat(chatId);
  }

  @override
  Future<void> deleteChat(String chatId) async {
    await localDataSource.deleteChat(chatId);
  }

  @override
  Future<Chat> createNewChat(String title) async {
    return await localDataSource.createNewChat(title);
  }
}
