import '../entities/chat.dart';
import '../repositories/chat_repository.dart';

class GetChatsUseCase {
  final ChatHistoryRepository repository;

  GetChatsUseCase(this.repository);

  Future<List<Chat>> getAllChats() async {
    return await repository.getAllChats();
  }

  Future<List<Chat>> getStarredChats() async {
    return await repository.getStarredChats();
  }
}
