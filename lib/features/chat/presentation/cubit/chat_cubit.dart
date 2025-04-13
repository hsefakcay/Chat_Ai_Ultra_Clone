import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/message.dart';
import '../../domain/usecases/send_message.dart';

// States
abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatError extends ChatState {
  final String message;

  const ChatError(this.message);

  @override
  List<Object> get props => [message];
}

class ChatLoaded extends ChatState {
  final List<Message> messages;

  const ChatLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}

// Cubit
class ChatCubit extends Cubit<ChatState> {
  final SendMessage sendMessage;
  final List<Message> _messages = [];

  ChatCubit({required this.sendMessage}) : super(ChatInitial());

  Future<void> sendUserMessage(String content) async {
    if (content.trim().isEmpty) return;

    // Add user message immediately
    final userMessage = Message(content: content, isUser: true);
    _messages.add(userMessage);
    emit(ChatLoaded(List.from(_messages)));

    // Show loading state
    emit(ChatLoading());

    // Get bot response
    final result = await sendMessage(content);

    result.fold(
      (failure) {
        _messages.add(Message(content: 'Error: ${failure.message}', isUser: false));
        emit(ChatLoaded(List.from(_messages)));
      },
      (botMessage) {
        _messages.add(botMessage);
        emit(ChatLoaded(List.from(_messages)));
      },
    );
  }
}
