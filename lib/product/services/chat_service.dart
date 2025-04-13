import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class ChatService {
  late final OpenAI _openAI;
  final _logger = Logger();

  ChatService() {
    final apiKey = dotenv.env['OPENAI_API_KEY'];
    if (apiKey == null) throw Exception('OpenAI API key not found in .env file');

    _openAI = OpenAI.instance.build(
      token: apiKey,
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
      ),
    );
  }

  Future<String> sendMessage(String message) async {
    try {
      _logger.d('Sending message to ChatGPT: $message');

      final request = ChatCompleteText(
        messages: [Messages(role: Role.user, content: message)],
        model: GptTurboChatModel(),
        maxToken: 150,
        temperature: 0.7,
      );

      final response = await _openAI.onChatCompletion(request: request);
      final content =
          response?.choices.first.message?.content ?? 'Sorry, I could not generate a response.';

      _logger.i('ChatGPT Response: $content');
      return content;
    } catch (e) {
      _logger.e('Error in ChatGPT response', error: e);
      return 'Error: $e';
    }
  }
}
