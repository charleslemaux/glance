import 'package:flutter/material.dart';
import '../../widgets/app_text_styles.dart';
import '../../widgets/glassmorphic_card.dart';
import 'base_consent_screen.dart';
import 'activity_tracking_screen.dart';

class SecureFingerprintScreen extends BaseConsentScreen {
  const SecureFingerprintScreen({
    super.key,
  }) : super(
          title: 'Glance',
          nextRoute: '/consent/activity_tracking',
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
                  Icons.shield_outlined,
                  size: 60,
                  color: const Color(0xFF8D7B68),
                ),
                const SizedBox(height: 24),
                Text(
                  'Secure Fingerprint',
                  style: AppTextStyles.subHeading.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8D7B68),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Your data remains private and secure, never shared with third parties or processed outside YouSearch.',
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
            const ActivityTrackingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}