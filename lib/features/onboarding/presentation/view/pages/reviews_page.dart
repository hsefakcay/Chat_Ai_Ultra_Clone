import 'package:flutter/material.dart';
import '../../../domain/entities/onboarding_entity.dart';

class ReviewsPage extends StatelessWidget {
  final ReviewsPageEntity model;

  const ReviewsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: model.reviews.length,
                  itemBuilder: (context, index) {
                    final review = model.reviews[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (review.title.isNotEmpty) ...[
                            Text(review.title, style: Theme.of(context).textTheme.headlineSmall),
                          ],
                          Row(
                            children: List.generate(
                              review.stars,
                              (index) => const Icon(Icons.star, color: Colors.amber, size: 24),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(review.description, style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withAlpha(0),
                          Colors.black.withAlpha(20),
                          Colors.black.withAlpha(50),
                          Colors.black.withAlpha(100),
                          Colors.black.withAlpha(150),
                          Colors.black.withAlpha(200),
                          Colors.black.withAlpha(255),
                        ],
                        stops: const [0.0, 0.2, 0.3, 0.5, 0.7, 0.8, 1.0],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            model.title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
