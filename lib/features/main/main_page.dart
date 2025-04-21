import 'package:chat_ai_ultra_clone/features/home/data/repositories/chat_options_repository_impl.dart';
import 'package:chat_ai_ultra_clone/features/home/domain/usecases/get_chat_options.dart';
import 'package:chat_ai_ultra_clone/features/home/presentation/bloc/home_bloc.dart';
import 'package:chat_ai_ultra_clone/features/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => HomeBloc(getChatOptionsUseCase: GetChatOptions(ChatOptionsRepositoryImpl())),
      child: const MainView(),
    );
  }
}
