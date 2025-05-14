import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import '../widgets/app_text_styles.dart';

class ConsentScreen extends StatelessWidget {
  const ConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define theme colors based on project guidelines
    final primaryColor = Color(0xFF6A1B9A); // Deep purple
    final accentColor = Color(0xFF4527A0); // Deep purple variant

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
                              style: AppTextStyles.heading.copyWith(
                                color: primaryColor,
                              ),
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
                            children: _buildFeaturesList(accentColor),
                          ),
                        ),
                      ),
                      
                      // Footer Section
                      Column(
                        children: [
                          // Terms and Privacy Policy
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.2),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.people,
                                  color: primaryColor,
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
                                          color: accentColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: ' and that you have read our ',
                                      ),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: AppTextStyles.body.copyWith(
                                          color: accentColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Consent Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate back to previous screen
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Consent',
                                style: AppTextStyles.buttonText,
                              ),
                            ),
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

  List<Widget> _buildFeaturesList(Color accentColor) {
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
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                feature['icon'] as IconData,
                size: 38,
                color: accentColor,
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
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      feature['description'] as String,
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}