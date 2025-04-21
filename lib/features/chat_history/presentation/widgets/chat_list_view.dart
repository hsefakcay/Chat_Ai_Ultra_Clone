import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_history_bloc.dart';
import 'empty_chat_state.dart';

/// ChatListView displays a list of chats.
/// If the list is empty, it shows the EmptyChatState widget.
class ChatListView extends StatelessWidget {
  final List<dynamic> chats;

  const ChatListView({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    if (chats.isEmpty) {
      return const EmptyChatState();
    }

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          title: Text(chat.title, style: const TextStyle(color: Colors.white)),
          subtitle: Text(chat.lastMessage, style: const TextStyle(color: Colors.grey)),
          trailing: IconButton(
            icon: Icon(chat.isStarred ? Icons.star : Icons.star_border, color: Colors.yellow),
            onPressed: () => _toggleStar(context, chat),
          ),
        );
      },
    );
  }

  void _toggleStar(BuildContext context, dynamic chat) {
    if (chat.isStarred) {
      context.read<ChatHistoryBloc>().add(UnstarChat(chat.id));
    } else {
      context.read<ChatHistoryBloc>().add(StarChat(chat.id));
    }
  }
}
