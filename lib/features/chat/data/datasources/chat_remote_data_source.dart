import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import '../models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<MessageModel> sendMessage(String content);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  late final OpenAI _openAI;
  final _logger = Logger();

  ChatRemoteDataSourceImpl() {
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

  @override
  Future<MessageModel> sendMessage(String content) async {
    try {
      _logger.d('Sending message to ChatGPT: $content');

      final request = ChatCompleteText(
        messages: [Messages(role: Role.user, content: content)],
        model: GptTurboChatModel(),
        maxToken: 150,
        temperature: 0.7,
      );

      final response = await _openAI.onChatCompletion(request: request);
      final botMessage = response?.choices.first.message?.content;

      if (botMessage == null) {
        _logger.e('No response received from ChatGPT');
        throw Exception('No response from OpenAI');
      }

      _logger.i('ChatGPT Response: $botMessage');
      return MessageModel.fromBot(botMessage);
    } catch (e) {
      _logger.e('Failed to get response from ChatGPT', error: e);
      throw Exception('Failed to get response from OpenAI: $e');
    }
  }
}
