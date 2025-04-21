import 'package:equatable/equatable.dart';
import '../../domain/entities/chat_option.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<ChatOption> chatOptions;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.chatOptions = const [],
    this.errorMessage,
  });

  HomeState copyWith({HomeStatus? status, List<ChatOption>? chatOptions, String? errorMessage}) {
    return HomeState(
      status: status ?? this.status,
      chatOptions: chatOptions ?? this.chatOptions,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, chatOptions, errorMessage];
}
