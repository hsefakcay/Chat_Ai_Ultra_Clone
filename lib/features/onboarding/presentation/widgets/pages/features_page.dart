import 'package:flutter/material.dart';
import '../../../domain/entities/onboarding_entity.dart';
import '../../../domain/entities/models/feature_item.dart';

class FeaturesPage extends StatelessWidget {
  final FeaturesPageEntity model;

  const FeaturesPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                model.title,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w400, letterSpacing: 1),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(
            height: 380,
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  child: Row(
                    children: [
                      Expanded(child: _buildFeatureItem(context, model.features[0], 1)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildFeatureItem(context, model.features[1], 2)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(child: _buildFeatureItem(context, model.features[2], 3)),
                const SizedBox(height: 12),
                Expanded(child: _buildFeatureItem(context, model.features[3], 4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, FeatureItem feature, int index) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child:
          index < 3
              ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      feature.iconPath,
                      width: 100,
                      height: 60,
                      fit: BoxFit.fitHeight,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error_outline, size: 48);
                      },
                    ),
                  ),
                  Text(
                    feature.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      feature.title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                  ),
                  Image.asset(
                    feature.iconPath,
                    width: 150,
                    height: 110,
                    fit: BoxFit.fitHeight,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error_outline, size: 48);
                    },
                  ),
                ],
              ),
    );
  }
}
