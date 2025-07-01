import 'package:flutter/material.dart';
import '../../widgets/app_text_styles.dart';
import '../../widgets/glassmorphic_card.dart';
import 'base_consent_screen.dart';
import '../home_screen.dart';

class TermsPrivacyScreen extends BaseConsentScreen {
  const TermsPrivacyScreen({
    super.key,
  }) : super(
          title: 'Glance',
          nextRoute: '/home',
          isLastScreen: true,
        );

  @override
  Widget buildContent(BuildContext context, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(animation),
        child: GlassmorphicCard(
          width: double.infinity,
          height: 300,
          borderRadius: 15,
          blur: 10,
          border: 1,
          baseAlpha: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people,
                  size: 60,
                  color: const Color(0xFF8D7B68),
                ),
                const SizedBox(height: 24),
                Text(
                  'Terms & Privacy',
                  style: AppTextStyles.subHeading.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8D7B68),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyles.body,
                    children: [
                      const TextSpan(
                        text: 'By pressing consent, you agree to our ',
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(
                        text: ' and that you have read our ',
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  String getButtonText() {
    return 'Consent';
  }

  @override
  void onButtonPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}