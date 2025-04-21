import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../product/routes/app_router.dart';

class SearchInputSection extends StatelessWidget {
  const SearchInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, AppRouter.chat),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.textAccent, width: 0.3),
            color: ColorConstants.backgroundDark,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AbsorbPointer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: StringConstants.askQuestion,
                  hintStyle: TextStyle(color: ColorConstants.textSecondary),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.add, size: 32, color: ColorConstants.textPrimary),
                ),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
