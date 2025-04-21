import 'package:chat_ai_ultra_clone/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/official_model.dart';

class OfficialModelsList extends StatelessWidget {
  final List<OfficialModel> models;

  const OfficialModelsList({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: models.length,
        itemBuilder: (context, index) {
          final model = models[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.45,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              boxShadow: List.filled(
                1,
                BoxShadow(color: ColorConstants.primary.withOpacity(0.5), blurRadius: 10),
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorConstants.primary, width: 2),
              color: ColorConstants.backgroundDark,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Image.asset(model.iconPath, width: 30, height: 30),
                      ),
                      Text(
                        model.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (model.isNew)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: ColorConstants.background,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Yeni 🔥',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
