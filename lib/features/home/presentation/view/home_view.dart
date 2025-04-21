import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/chat_options_section.dart';
import '../widgets/greeting_section.dart';
import '../widgets/search_input_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.initial) {
          context.read<HomeBloc>().add(LoadChatOptions());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ChatOptionsSection(),
            const SizedBox(height: 24),
            const GreetingSection(),
            const SizedBox(height: 20),
            const SearchInputSection(),
            const Spacer(),
          ],
        );
      },
    );
  }
}
