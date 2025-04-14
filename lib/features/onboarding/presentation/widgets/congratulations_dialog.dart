import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../core/constants/padding_constants.dart';

class CongratulationsDialog extends StatelessWidget {
  final VoidCallback onContinue;

  const CongratulationsDialog({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: PaddingConstants.dialogPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white, size: 72),
            const SizedBox(height: PaddingConstants.smallSpacing),
            Text(
              StringConstants.congratulationsTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: PaddingConstants.sectionSpacing),
            Text(
              StringConstants.congratulationsMessage,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontSize: 15, letterSpacing: 0.5),
            ),
            const SizedBox(height: PaddingConstants.contentSpacing),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.primary,
                  padding: PaddingConstants.buttonPadding,
                ),
                child: Text(
                  StringConstants.congratulationsContinue,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
