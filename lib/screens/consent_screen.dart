import 'package:flutter/material.dart';
import 'package:glance/screens/consent/consent_data.dart';
import 'package:glance/screens/consent/dynamic_consent_screen.dart';

/// ConsentScreen is now a wrapper that starts the consent flow
/// with the first screen (ProfileManagementScreen)
class ConsentScreen extends StatelessWidget {
  const ConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Immediately show the first consent screen
    return DynamicConsentScreen(
      feature: consentFeatures.first,
      currentIndex: 0,
    );
  }
}