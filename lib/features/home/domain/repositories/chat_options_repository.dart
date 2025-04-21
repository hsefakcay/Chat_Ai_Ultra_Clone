import '../entities/chat_option.dart';

abstract class ChatOptionsRepository {
  List<ChatOption> getChatOptions();
}
