import '../entities/chat.dart';

abstract class ChatHistoryRepository {
  Future<List<Chat>> getAllChats();
  Future<List<Chat>> getStarredChats();
  Future<void> starChat(String chatId);
  Future<void> unstarChat(String chatId);
  Future<void> deleteChat(String chatId);
  Future<Chat> createNewChat(String title);
}
