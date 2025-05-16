import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import '../widgets/app_text_styles.dart';
import '../widgets/glassmorphic_card.dart';
import '../widgets/app_button.dart';

class ConsentScreen extends StatelessWidget {
  const ConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Header Section
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Column(
                          children: [
                            Text(
                              'Welcome to',
                              style: AppTextStyles.heading,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Glance',
                              style: AppTextStyles.heading, // Assuming theme or style handles color
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      
                      // Features List - Hardcoded in column layout
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: ListView(
                            children: [
                              // Profile Management Feature
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: GlassmorphicCard(
                                  width: double.infinity,
                                  height: 160, // Increased height for column layout
                                  borderRadius: 15,
                                  blur: 10,
                                  border: 1,
                                  baseAlpha: 100, // Increased opacity for better contrast with text
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.person_outline,
                                          size: 38,
                                          color: const Color(0xFF8D7B68),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'Profile Management',
                                          style: AppTextStyles.body.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF8D7B68),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Effortlessly update and manage your personal information, settings, and preferences.',
                                          style: AppTextStyles.body.copyWith(
                                            fontSize: 14,
                                            color: const Color(0xFFA4907C),
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              
                              // Secure Fingerprint Feature
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: GlassmorphicCard(
                                  width: double.infinity,
                                  height: 160,
                                  borderRadius: 15,
                                  blur: 10,
                                  border: 1,
                                  baseAlpha: 100, // Increased opacity for better contrast with text
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.shield_outlined,
                                          size: 38,
                                          color: const Color(0xFF8D7B68),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'Secure Fingerprint',
                                          style: AppTextStyles.body.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF8D7B68),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Your data remains private and secure, never shared with third parties or processed outside YouSearch.',
                                          style: AppTextStyles.body.copyWith(
                                            fontSize: 14,
                                            color: const Color(0xFFA4907C),
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              
                              // Activity Tracking Feature
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: GlassmorphicCard(
                                  width: double.infinity,
                                  height: 160,
                                  borderRadius: 15,
                                  blur: 10,
                                  border: 1,
                                  baseAlpha: 100, // Increased opacity for better contrast with text
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.analytics_outlined,
                                          size: 38,
                                          color: const Color(0xFF8D7B68),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'Activity Tracking',
                                          style: AppTextStyles.body.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF8D7B68),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Track your daily activities and monitor your progress over time with detailed insights.',
                                          style: AppTextStyles.body.copyWith(
                                            fontSize: 14,
                                            color: const Color(0xFFA4907C),
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      // Footer Section
                      Column(
                        children: [
                          // Terms and Privacy Policy
                          GlassmorphicCard(
                            width: double.infinity,
                            height: 112,
                            borderRadius: 15,
                            blur: 10, // Adjusted blur for better readability
                            border: 1,  // Adjusted border for subtlety
                            baseAlpha: 100, // Increased opacity for better contrast with text
                            child: Padding(
                              padding: const EdgeInsets.all(10.0), // Restore original padding
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.people,
                                  color: const Color(0xFF8D7B68),
                                  size: 24,
                                ),
                                const SizedBox(height: 8),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: AppTextStyles.body,
                                    children: [
                                      const TextSpan(
                                        text: 'By pressing continue, you agree to our ',
                                      ),
                                      TextSpan(
                                        text: 'Terms of Service',
                                        style: AppTextStyles.body.copyWith(
                                          // color: accentColor, // Rely on theme or define a specific style in AppTextStyles if needed
                                          fontWeight: FontWeight.w600,
                                          // Example: color: Theme.of(context).colorScheme.secondary // if accentColor maps to secondary
                                        ),
                                      ),
                                      const TextSpan(
                                        text: ' and that you have read our ',
                                      ),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: AppTextStyles.body.copyWith(
                                          // color: accentColor, // Rely on theme or define a specific style in AppTextStyles if needed
                                          fontWeight: FontWeight.w600,
                                          // Example: color: Theme.of(context).colorScheme.secondary // if accentColor maps to secondary
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ], // This closes the children of Column
                            ), // This closes the Column
                            ), // This closes the Padding
                          ), // This closes the GlassmorphicCard
                          
                          const SizedBox(height: 20),
                          
                          // Consent Button
                          AppButton(
                            text: 'Consent',
                            onPressed: () {
                              // Navigate back to previous screen
                              Navigator.pop(context);
                            },
                          ),
                        ],
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

  // Method removed as features are now hardcoded directly in the UI
}