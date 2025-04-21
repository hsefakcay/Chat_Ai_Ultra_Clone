import '../../domain/entities/chat.dart';
import '../models/chat_model.dart';

abstract class ChatLocalDataSource {
  Future<List<Chat>> getAllChats();
  Future<List<Chat>> getStarredChats();
  Future<void> starChat(String chatId);
  Future<void> unstarChat(String chatId);
  Future<void> deleteChat(String chatId);
  Future<Chat> createNewChat(String title);
}

class ChatLocalDataSourceImpl implements ChatLocalDataSource {
  ChatLocalDataSourceImpl();

  @override
  Future<List<Chat>> getAllChats() async {
    return [];
  }

  @override
  Future<List<Chat>> getStarredChats() async {
    final chats = await getAllChats();
    return chats.where((chat) => chat.isStarred).toList();
  }

  @override
  Future<void> starChat(String chatId) async {
    // Implementation will be added
  }

  @override
  Future<void> unstarChat(String chatId) async {
    // Implementation will be added
  }

  @override
  Future<void> deleteChat(String chatId) async {
    // Implementation will be added
  }

  @override
  Future<Chat> createNewChat(String title) async {
    final newChat = ChatModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      createdAt: DateTime.now(),
      isStarred: false,
      lastMessage: '',
    );
    // Save to SharedPreferences implementation will be added
    return newChat;
  }
}
