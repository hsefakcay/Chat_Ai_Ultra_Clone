import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_chat_options.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetChatOptions getChatOptionsUseCase;

  HomeBloc({required this.getChatOptionsUseCase}) : super(const HomeState()) {
    on<LoadChatOptions>(_onLoadChatOptions);
    on<ChatOptionSelected>(_onChatOptionSelected);
  }

  void _onLoadChatOptions(LoadChatOptions event, Emitter<HomeState> emit) {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final chatOptions = getChatOptionsUseCase();
      emit(state.copyWith(status: HomeStatus.loaded, chatOptions: chatOptions));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error, errorMessage: e.toString()));
    }
  }

  void _onChatOptionSelected(ChatOptionSelected event, Emitter<HomeState> emit) {
    // Navigation will be handled in the view
  }
}
