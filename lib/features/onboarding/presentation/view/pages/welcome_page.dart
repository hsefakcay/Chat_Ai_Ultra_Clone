import 'package:chat_ai_ultra_clone/core/constants/string_constants.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/onboarding_entity.dart';

class WelcomePage extends StatelessWidget {
  final WelcomePageEntity model;

  const WelcomePage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                model.imagePath,
                width: size.width * 0.5,
                height: size.width * 0.45,
                fit: BoxFit.cover,
              ),
              Text(
                model.title,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              if (model.description != null) ...[
                const SizedBox(height: 12),
                Text(
                  model.description!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 8),
              Text(
                StringConstants.usedModels,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Image.asset(
            'assets/images/starsPng.png',
            width: size.width * 0.75,
            height: size.height * 0.1,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
