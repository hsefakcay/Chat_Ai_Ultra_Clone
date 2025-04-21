import 'package:chat_ai_ultra_clone/core/constants/color_constants.dart';
import 'package:chat_ai_ultra_clone/core/constants/string_constants.dart';
import 'package:chat_ai_ultra_clone/features/chat_history/presentation/bloc/chat_history_bloc.dart';
import 'package:chat_ai_ultra_clone/features/chat_history/presentation/view/chat_history_view.dart';
import 'package:chat_ai_ultra_clone/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:chat_ai_ultra_clone/features/settings/presentation/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../discover/presentation/views/discover_view.dart';
import '../home/presentation/view/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 1; // Start with home selected

  final List<Widget> _pages = [const DiscoverView(), const HomeView(), const ChatHistoryView()];

  void onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void createNewChat() {
    context.read<ChatHistoryBloc>().add(const CreateNewChat('New Chat'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          _currentIndex != 2 ? StringConstants.appTitle : StringConstants.chats,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: MediaQuery.sizeOf(context).width * 0.08,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsView()),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex, onTap: onTabSelected),
      floatingActionButton:
          _currentIndex != 1
              ? FloatingActionButton.extended(
                onPressed: createNewChat,
                icon: const Icon(Icons.add_circle_rounded, color: Colors.black, size: 32),
                label: const Text(
                  'Yeni Sohbet',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),

                backgroundColor: Colors.white,
              )
              : const SizedBox.shrink(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
