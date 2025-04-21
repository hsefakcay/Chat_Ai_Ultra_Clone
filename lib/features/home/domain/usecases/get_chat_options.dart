import '../entities/chat_option.dart';
import '../repositories/chat_options_repository.dart';

class GetChatOptions {
  final ChatOptionsRepository repository;

  GetChatOptions(this.repository);

  List<ChatOption> call() {
    return repository.getChatOptions();
  }
}
