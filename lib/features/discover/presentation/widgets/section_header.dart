import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;

  const SectionHeader({super.key, required this.title, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 24)),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(actionText, style: Theme.of(context).textTheme.bodySmall),
              const Icon(Icons.chevron_right, color: Colors.white70),
            ],
          ),
        ),
      ],
    );
  }
}
