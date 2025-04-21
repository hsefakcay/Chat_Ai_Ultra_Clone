import 'package:chat_ai_ultra_clone/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

/// EmptyChatState is a widget that displays when there are no chats to show.
class EmptyChatState extends StatelessWidget {
  const EmptyChatState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_rounded, size: 72, color: ColorConstants.primary),
          const SizedBox(height: 16),
          Text(
            'Henüz Burada Hiçbir\nŞey Yok',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'AI ile sohbet etmeye başlayarak\nsohbet geçmişinizi oluşturun.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
