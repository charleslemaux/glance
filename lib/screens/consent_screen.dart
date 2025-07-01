import 'package:flutter/material.dart';
import 'consent/consent_screens.dart';

/// ConsentScreen is now a wrapper that starts the consent flow
/// with the first screen (ProfileManagementScreen)
class ConsentScreen extends StatelessWidget {
  const ConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Immediately show the first consent screen
    return const ProfileManagementScreen();
  }
}