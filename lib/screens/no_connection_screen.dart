import 'package:flutter/material.dart';
import '../widgets/app_background.dart';
import '../widgets/app_text_styles.dart';
import '../widgets/app_button.dart';

class NoConnectionScreen extends StatelessWidget {
  final VoidCallback onRetry;
  final bool isLoading;

  const NoConnectionScreen({super.key, required this.onRetry, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Added to match other screens
      body: AppBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off, size: 80, color: Colors.white), // Changed color
                const SizedBox(height: 24),
                Text(
                  'Not connected',
                  style: AppTextStyles.subHeading,
                  textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 12),
                Text(
                  'Please check your internet connection and try again.',
                  style: AppTextStyles.body,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                AppButton(
                  text: 'Retry',
                  isLoading: isLoading,
                  onPressed: onRetry,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}