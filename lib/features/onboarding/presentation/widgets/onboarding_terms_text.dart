import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../core/constants/url_constants.dart';
import '../../../../core/theme/app_theme.dart';

class OnboardingTermsText extends StatelessWidget {
  const OnboardingTermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTheme.termsTextStyle,
          children: [
            const TextSpan(text: StringConstants.termsStart),
            TextSpan(
              text: ' ${StringConstants.termsPrivacyPolicy} \n',
              style: AppTheme.termsLinkStyle,
              recognizer:
                  TapGestureRecognizer()..onTap = () => _launchURL(UrlConstants.privacyPolicy),
            ),
            const TextSpan(text: StringConstants.termsAnd),
            TextSpan(
              text: StringConstants.termsOfService,
              style: AppTheme.termsLinkStyle,
              recognizer:
                  TapGestureRecognizer()..onTap = () => _launchURL(UrlConstants.termsOfService),
            ),
            const TextSpan(text: StringConstants.termsAccept),
            const TextSpan(text: '\n ${StringConstants.termsEnd}.'),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }
}
