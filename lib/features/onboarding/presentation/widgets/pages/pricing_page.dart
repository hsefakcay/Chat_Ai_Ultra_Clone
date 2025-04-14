import 'package:chat_ai_ultra_clone/core/constants/string_constants.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/color_constants.dart';
import '../../../domain/entities/onboarding_entity.dart';

class PricingPage extends StatelessWidget {
  final PricingPageEntity model;

  const PricingPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/onboarding.jpeg',
            width: size.width,
            height: size.height * 0.32,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error_outline, size: 48);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorConstants.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      model.title,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 34,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(model.description ?? '', style: Theme.of(context).textTheme.headlineLarge),
              ],
            ),
          ),
          Column(
            children:
                model.features.map((feature) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        if (feature.iconPath == "chat")
                          Icon(Icons.chat, size: 28)
                        else if (feature.iconPath == "answer")
                          Icon(Icons.question_answer_rounded, size: 28)
                        else
                          Icon(Icons.image_rounded, size: 28),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            feature.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.pricingItems.length,
              itemBuilder: (context, index) {
                final item = model.pricingItems[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 20, right: 12.0, bottom: 2),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: size.width * 0.27,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color:
                                item.isHighlighted
                                    ? ColorConstants.secondary
                                    : ColorConstants.background,
                            border:
                                item.isHighlighted
                                    ? Border.all(color: ColorConstants.primary, width: 2)
                                    : Border.all(color: ColorConstants.primary, width: 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  item.price,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                                if (item.isHighlighted)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: ColorConstants.primary,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          item.subtitle!,
                                          style: Theme.of(context).textTheme.labelSmall,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  )
                                else if (item.subtitle != null)
                                  Text(
                                    item.subtitle!,
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: ColorConstants.termsText,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (item.isHighlighted)
                        Positioned(
                          top: -10,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: ColorConstants.deepPurple,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '%82 İNDİRİM!',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: ColorConstants.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Center(
            child: Text(
              StringConstants.automaticRenewable,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: ColorConstants.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
