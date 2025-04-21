import 'package:chat_ai_ultra_clone/core/constants/color_constants.dart';
import 'package:chat_ai_ultra_clone/core/constants/padding_constants.dart';
import 'package:chat_ai_ultra_clone/features/onboarding/presentation/view/onboarding_view_mixin.dart';
import 'package:chat_ai_ultra_clone/features/onboarding/presentation/view/pages/onboarding_page_content.dart';
import 'package:chat_ai_ultra_clone/features/onboarding/presentation/widgets/congratulations_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import '../widgets/onboarding_continue_button.dart';
import '../widgets/onboarding_page_indicator.dart';
import '../widgets/onboarding_terms_text.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with PageControllerMixin {
  @override
  void onPageChanged(int page) {
    context.read<OnboardingCubit>().updatePage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            if (state.status == OnboardingStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == OnboardingStatus.error) {
              return Center(child: Text(state.errorMessage ?? 'Bir hata oluştu'));
            }
            return Stack(
              children: [
                Column(
                  children: [
                    OnboardingPageIndicator(state: state),
                    Expanded(child: _buildPageView(context, state)),
                    _buildBottomSection(context, state),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPageView(BuildContext context, OnboardingState state) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: state.pages.length,
      itemBuilder: (context, index) {
        return OnboardingPageContent(model: state.pages[index]);
      },
    );
  }

  Widget _buildBottomSection(BuildContext context, OnboardingState state) {
    final bool isLastPage = state.currentPage == state.pages.length - 1;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: PaddingConstants.pagePadding.horizontal,
        vertical: PaddingConstants.pageVerticalPadding.vertical,
      ),
      child: Column(
        children: [
          OnboardingContinueButton(
            onPressed: () => _handleContinueButtonPress(context, isLastPage),
          ),
          const SizedBox(height: PaddingConstants.smallSpacing),
          isLastPage ? _buildPricingBottomSection(context) : const OnboardingTermsText(),
        ],
      ),
    );
  }

  void _handleContinueButtonPress(BuildContext context, bool isLastPage) {
    if (!isLastPage) {
      nextPage();
    } else {
      _showCongratulationsDialog(context);
    }
  }

  Future<void> _showCongratulationsDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (dialogContext) => CongratulationsDialog(
            onContinue: () {
              Navigator.of(dialogContext).pop();

              if (context.mounted) {
                context.read<OnboardingCubit>().onNextPage(context);
              }
            },
          ),
    );
  }

  Widget _buildPricingBottomSection(BuildContext context) {
    return Column(
      children: [
        _buildCancelAnytime(context),
        const SizedBox(height: PaddingConstants.smallSpacing),
        _buildBottomLinks(context),
      ],
    );
  }

  Widget _buildCancelAnytime(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle_outline, color: ColorConstants.primary, size: 20),
        const SizedBox(width: PaddingConstants.smallSpacing),
        Text(
          'İSTEDİĞİNİZ ZAMAN İPTAL EDİN',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: ColorConstants.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomLinks(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTextButton(context, 'Gizlilik ve Hizmet Şartları', () {
          /* Add terms and conditions navigation */
        }),
        _buildTextButton(context, 'Geri Yükle', () {
          /* Add restore purchase navigation */
        }),
      ],
    );
  }

  Widget _buildTextButton(BuildContext context, String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(color: ColorConstants.textSecondary),
      ),
    );
  }
}
