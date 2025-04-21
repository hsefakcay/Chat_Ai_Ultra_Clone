import 'package:equatable/equatable.dart';
import '../../domain/entities/chat_option.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadChatOptions extends HomeEvent {}

class ChatOptionSelected extends HomeEvent {
  final ChatOption option;

  const ChatOptionSelected(this.option);

  @override
  List<Object?> get props => [option];
}
