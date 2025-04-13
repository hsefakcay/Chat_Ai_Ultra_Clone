import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../product/widgets/app_text_field.dart';
import '../cubit/chat_cubit.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    context.read<ChatCubit>().sendUserMessage(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: AppTextField(
              controller: _controller,
              hintText: 'Type a message...',
              onSubmitted: _sendMessage,
            ),
          ),
          const SizedBox(width: 8),
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return IconButton(
                onPressed: state is ChatLoading ? null : _sendMessage,
                icon:
                    state is ChatLoading
                        ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator())
                        : const Icon(Icons.send),
                color: Theme.of(context).colorScheme.primary,
              );
            },
          ),
        ],
      ),
    );
  }
}
