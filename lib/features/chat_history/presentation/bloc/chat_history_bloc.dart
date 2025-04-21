import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/chat.dart';
import '../../domain/usecases/get_chats_usecase.dart';

// Events
abstract class ChatHistoryEvent extends Equatable {
  const ChatHistoryEvent();

  @override
  List<Object> get props => [];
}

class LoadChats extends ChatHistoryEvent {}

class StarChat extends ChatHistoryEvent {
  final String chatId;

  const StarChat(this.chatId);

  @override
  List<Object> get props => [chatId];
}

class UnstarChat extends ChatHistoryEvent {
  final String chatId;

  const UnstarChat(this.chatId);

  @override
  List<Object> get props => [chatId];
}

class CreateNewChat extends ChatHistoryEvent {
  final String title;

  const CreateNewChat(this.title);

  @override
  List<Object> get props => [title];
}

// States
abstract class ChatHistoryState extends Equatable {
  const ChatHistoryState();

  @override
  List<Object> get props => [];
}

class ChatHistoryInitial extends ChatHistoryState {}

class ChatHistoryLoading extends ChatHistoryState {}

class ChatHistoryLoaded extends ChatHistoryState {
  final List<Chat> allChats;
  final List<Chat> starredChats;

  const ChatHistoryLoaded({required this.allChats, required this.starredChats});

  @override
  List<Object> get props => [allChats, starredChats];
}

class ChatHistoryError extends ChatHistoryState {
  final String message;

  const ChatHistoryError(this.message);

  @override
  List<Object> get props => [message];
}

// BLoC
class ChatHistoryBloc extends Bloc<ChatHistoryEvent, ChatHistoryState> {
  final GetChatsUseCase getChatsUseCase;

  ChatHistoryBloc({required this.getChatsUseCase}) : super(ChatHistoryInitial()) {
    on<LoadChats>(_onLoadChats);
    on<StarChat>(_onStarChat);
    on<UnstarChat>(_onUnstarChat);
    on<CreateNewChat>(_onCreateNewChat);
  }

  Future<void> _onLoadChats(LoadChats event, Emitter<ChatHistoryState> emit) async {
    emit(ChatHistoryLoading());
    try {
      final allChats = await getChatsUseCase.getAllChats();
      final starredChats = await getChatsUseCase.getStarredChats();
      emit(ChatHistoryLoaded(allChats: allChats, starredChats: starredChats));
    } catch (e) {
      emit(ChatHistoryError(e.toString()));
    }
  }

  Future<void> _onStarChat(StarChat event, Emitter<ChatHistoryState> emit) async {
    // TODO: Implement star chat functionality
  }

  Future<void> _onUnstarChat(UnstarChat event, Emitter<ChatHistoryState> emit) async {
    // TODO: Implement unstar chat functionality
  }

  Future<void> _onCreateNewChat(CreateNewChat event, Emitter<ChatHistoryState> emit) async {
    // TODO: Implement create new chat functionality
  }
}
