import 'package:flutter/material.dart';
import '../../../../core/constants/string_constants.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', width: size.width, height: size.height * 0.23),
          Text(
            StringConstants.greeting,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            StringConstants.helperText,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 19),
          ),
        ],
      ),
    );
  }
}
