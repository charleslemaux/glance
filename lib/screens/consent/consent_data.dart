import 'package:flutter/material.dart';

class ConsentFeature {
  final IconData icon;
  final String title;
  final String description;
  final bool isRichText;

  ConsentFeature({
    required this.icon,
    required this.title,
    required this.description,
    this.isRichText = false,
  });
}

final List<ConsentFeature> consentFeatures = [
  ConsentFeature(
    icon: Icons.person_outline,
    title: 'Profile Management',
    description: 'Effortlessly update and manage your personal information, settings, and preferences.',
  ),
  ConsentFeature(
    icon: Icons.shield_outlined,
    title: 'Secure Fingerprint',
    description: 'Your data remains private and secure, never shared with third parties or processed outside YouSearch.',
  ),
  ConsentFeature(
    icon: Icons.analytics_outlined,
    title: 'Activity Tracking',
    description: 'Track your daily activities and monitor your progress over time with detailed insights.',
  ),
  ConsentFeature(
    icon: Icons.people,
    title: 'Terms & Privacy',
    description: 'By pressing consent, you agree to our Terms of Service and that you have read our Privacy Policy',
    isRichText: true,
  ),
];