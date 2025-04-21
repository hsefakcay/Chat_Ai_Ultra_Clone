import 'package:chat_ai_ultra_clone/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ChatOptionCard extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback? onTap;

  const ChatOptionCard({super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size.width * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SizedBox(
                width: size.width * 0.13,
                height: size.width * 0.13,
                child: CircleAvatar(
                  backgroundColor: ColorConstants.textPrimary,
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Image.asset(
                        icon,
                        fit: BoxFit.cover,
                        width: size.width * 0.13,
                        height: size.width * 0.13,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
