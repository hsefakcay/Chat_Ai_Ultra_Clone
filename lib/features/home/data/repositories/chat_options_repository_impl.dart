import '../../../../core/constants/string_constants.dart';
import '../../domain/entities/chat_option.dart';
import '../../domain/repositories/chat_options_repository.dart';
import '../models/chat_option_model.dart';

class ChatOptionsRepositoryImpl implements ChatOptionsRepository {
  @override
  List<ChatOption> getChatOptions() {
    return [
      const ChatOptionModel(
        title: StringConstants.ghibliStyle,
        icon: 'assets/images/ghib.png',
        route: '/ghibli',
      ),
      const ChatOptionModel(
        title: StringConstants.imageGenerator,
        icon: 'assets/images/image.jpg',
        route: '/image-generator',
      ),
      const ChatOptionModel(
        title: StringConstants.voiceChat,
        icon: 'assets/images/chatgpt.png',
        route: '/voice-chat',
      ),
      const ChatOptionModel(
        title: StringConstants.openAiGpt,
        icon: 'assets/images/chatgpt.png',
        route: '/gpt',
      ),
      const ChatOptionModel(
        title: StringConstants.openAiGpt,
        icon: 'assets/images/chatgpt.png',
        route: '/gpt',
      ),
    ];
  }
}
