import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/chat_options_repository_impl.dart';
import '../../domain/usecases/get_chat_options.dart';
import '../bloc/home_bloc.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => HomeBloc(getChatOptionsUseCase: GetChatOptions(ChatOptionsRepositoryImpl())),
      child: const HomeView(),
    );
  }
}
