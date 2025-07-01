import 'package:flutter/material.dart';
import '../../widgets/app_text_styles.dart';
import '../../widgets/glassmorphic_card.dart';
import 'base_consent_screen.dart';
import 'terms_privacy_screen.dart';

class ActivityTrackingScreen extends BaseConsentScreen {
  const ActivityTrackingScreen({
    super.key,
  }) : super(
          title: 'Glance',
          nextRoute: '/consent/terms_privacy',
          isLastScreen: false,
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
                  Icons.analytics_outlined,
                  size: 60,
                  color: const Color(0xFF8D7B68),
                ),
                const SizedBox(height: 24),
                Text(
                  'Activity Tracking',
                  style: AppTextStyles.subHeading.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8D7B68),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Track your daily activities and monitor your progress over time with detailed insights.',
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
    return 'Continue';
  }

  @override
  void onButtonPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TermsPrivacyScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}