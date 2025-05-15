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
                      
                      // Features List
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: ListView(
                            children: _buildFeaturesList(), // Removed accentColor argument
                          ),
                        ),
                      ),
                      
                      // Footer Section
                      Column(
                        children: [
                          // Terms and Privacy Policy
                          GlassmorphicCard(
                            width: double.infinity,
                            height: 150, // Provide a fixed height for the card
                            borderRadius: 15,
                            blur: 10, // Adjusted blur for better readability
                            border: 1,  // Adjusted border for subtlety
                            child: Padding(
                              padding: const EdgeInsets.all(16.0), // Restore original padding
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.people,
                                  // color: primaryColor, // Removed hardcoded color, assuming theme or default
                                  size: 24,
                                ),
                                const SizedBox(height: 8),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: AppTextStyles.body, // Assuming AppTextStyles.body has appropriate default color
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

  List<Widget> _buildFeaturesList() {
    final features = [
      {
        'title': 'Profile Management',
        'description': 'Effortlessly update and manage your personal information, settings, and preferences.',
        'icon': Icons.person_outline,
      },
      {
        'title': 'Secure Fingerprint',
        'description': 'Your data remains private and secure, never shared with third parties or processed outside YouSearch.',
        'icon': Icons.shield_outlined,
      },
      {
        'title': 'Activity Tracking',
        'description': 'Track your daily activities and monitor your progress over time with detailed insights.',
        'icon': Icons.analytics_outlined,
      },
    ];

    return features.map((feature) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: GlassmorphicCard(
          width: double.infinity,
          height: 100, // Provide a fixed height for the feature card
          borderRadius: 15,
          blur: 10, // Adjusted blur for better readability
          border: 1,  // Adjusted border for subtlety
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Restore original padding
            child: Row(
            children: [
              Icon(
                feature['icon'] as IconData,
                size: 38,
                // Assuming icon color is handled by theme or a default white/appropriate color
                // color: accentColor, // Removed hardcoded color
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      feature['title'] as String,
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Ensure title is clearly visible
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      feature['description'] as String,
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14,
                        color: Colors.white70, // Keep description slightly less prominent
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ), // This closes the Row
          ), // This closes the Padding
        ), // This closes the GlassmorphicCard
      );
    }).toList();
  }
}