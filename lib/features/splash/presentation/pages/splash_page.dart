import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SplashBloc>()..add(const CheckSplashState()),
      child: const _SplashPageView(),
    );
  }
}

class _SplashPageView extends StatelessWidget {
  const _SplashPageView();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;

    // Logo size calculation
    final double logoSize =
        isSmallScreen
            ? size.width *
                0.5 // Küçük ekranlarda ekran genişliğinin %80'i
            : size.width * 0.3; // Büyük ekranlarda ekran genişliğinin %60'ı

    // Text logo height calculation
    final double textLogoHeight =
        isSmallScreen
            ? size.height *
                0.05 // Küçük ekranlarda ekran yüksekliğinin %8'i
            : size.height * 0.03; // Büyük ekranlarda ekran yüksekliğinin %6'sı

    // Spacing calculations
    final double verticalSpacing = size.height * 0.3; // Ekran yüksekliğinin %20'si

    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.isRedirectHome) {
          Navigator.of(context).pushReplacementNamed('/onboarding');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: verticalSpacing),
                SizedBox(
                  width: logoSize,
                  height: logoSize,
                  child: Image.asset('assets/images/logo.png', fit: BoxFit.fitWidth),
                ),
                SizedBox(height: verticalSpacing),
                SizedBox(
                  height: textLogoHeight,
                  child: Image.asset('assets/images/connectinno.png', fit: BoxFit.contain),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
