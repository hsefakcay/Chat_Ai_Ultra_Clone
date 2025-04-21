import 'package:chat_ai_ultra_clone/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/expert.dart';

class ExpertsList extends StatelessWidget {
  final List<Expert> experts;

  const ExpertsList({super.key, required this.experts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experts.length,
      itemBuilder: (context, index) {
        final expert = experts[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorConstants.backgroundDark,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            leading: CircleAvatar(radius: 30, backgroundImage: AssetImage(expert.imagePath)),
            title: Text(
              expert.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              expert.description,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
            ),
            trailing: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: ColorConstants.buttonText,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: const Text(
                  'Sohbet',
                  style: TextStyle(color: ColorConstants.primary, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
