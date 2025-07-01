import 'package:flutter/material.dart';
import 'package:glance/screens/consent/consent_data.dart';
import 'package:glance/screens/home_screen.dart';
import 'package:glance/widgets/app_text_styles.dart';
import 'package:glance/widgets/glassmorphic_card.dart';
import 'base_consent_screen.dart';

class DynamicConsentScreen extends BaseConsentScreen {
  final ConsentFeature feature;
  final int currentIndex;

  const DynamicConsentScreen({
    super.key,
    required this.feature,
    required this.currentIndex,
  }) : super(
          title: 'Glance',
          nextRoute: '', // This will be handled dynamically
        );

  @override
  bool get isLastScreen => currentIndex == consentFeatures.length - 1;

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
                  feature.icon,
                  size: 60,
                  color: const Color(0xFF8D7B68),
                ),
                const SizedBox(height: 24),
                Text(
                  feature.title,
                  style: AppTextStyles.subHeading.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8D7B68),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                if (feature.isRichText)
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
                  )
                else
                  Text(
                    feature.description,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 16,
                      color: const Color(0xFFA4907C),
                    ),
                    textAlign: TextAlign.center,
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
    return isLastScreen ? 'Consent' : 'Continue';
  }

  @override
  void onButtonPressed(BuildContext context) {
    if (isLastScreen) {
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
    } else {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              DynamicConsentScreen(
            feature: consentFeatures[currentIndex + 1],
            currentIndex: currentIndex + 1,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    }
  }
}