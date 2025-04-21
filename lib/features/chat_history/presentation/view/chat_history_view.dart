import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_ai_ultra_clone/core/constants/color_constants.dart';
import '../bloc/chat_history_bloc.dart';
import '../widgets/chat_list_view.dart';
import '../widgets/empty_chat_state.dart';

/// ChatHistoryView is the main view for displaying chat history.
/// It shows all chats and starred chats in separate tabs.
class ChatHistoryView extends StatefulWidget {
  const ChatHistoryView({super.key});

  @override
  State<ChatHistoryView> createState() => _ChatHistoryViewState();
}

class _ChatHistoryViewState extends State<ChatHistoryView> {
  @override
  void initState() {
    super.initState();
    _loadChats();
  }

  void _loadChats() {
    context.read<ChatHistoryBloc>().add(LoadChats());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return DefaultTabController(
      length: 2,
      child: Column(children: [_buildTabBar(), _buildTabBarView()]),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      tabs: [
        Tab(child: Text('Hepsi', style: Theme.of(context).textTheme.headlineSmall)),
        Tab(child: Text('Yıldızlı', style: Theme.of(context).textTheme.headlineSmall)),
      ],
      labelColor: ColorConstants.termsText,
      indicatorColor: ColorConstants.termsText,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: const UnderlineTabIndicator(borderSide: BorderSide(width: 4, color: Colors.white)),
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: BlocBuilder<ChatHistoryBloc, ChatHistoryState>(
        builder: (context, state) {
          if (state is ChatHistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ChatHistoryError) {
            return _buildErrorState(state.message);
          }

          if (state is ChatHistoryLoaded) {
            return TabBarView(
              children: [
                ChatListView(chats: state.allChats),
                ChatListView(chats: state.starredChats),
              ],
            );
          }

          return const EmptyChatState();
        },
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(child: Text(message, style: const TextStyle(color: Colors.red)));
  }
}
