import 'package:flutter/material.dart';
import 'app_text_styles.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final double? width;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: const Color(0xFF8D7B68), // New palette: Darkest brown
          foregroundColor: const Color(0xFFF1DEC9), // New palette: Lightest (consistent with AppTextStyles.buttonText)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: const Color(0xFFF1DEC9).withAlpha(70)), // New palette: Lightest for border
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Color(0xFFF1DEC9), // New palette: Lightest for progress indicator
                  strokeWidth: 2,
                ),
              )
            : Text(text, style: AppTextStyles.buttonText),
      ),
    );
  }
}