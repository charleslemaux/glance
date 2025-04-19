import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoConnectionScreen extends StatelessWidget {
  final VoidCallback onRetry;
  final bool isLoading;

  const NoConnectionScreen({super.key, required this.onRetry, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true, // Added to match other screens
      body: Container( // Added Container for gradient
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A1B9A),  // Deep purple
              Color(0xFF4527A0),  // Deep purple variant
              Color(0xFF311B92),  // Indigo
            ],
          ),
        ),
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
                  style: GoogleFonts.poppins( // Added GoogleFonts
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Changed color
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Please check your internet connection and try again.',
                  style: GoogleFonts.poppins( // Added GoogleFonts
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70, // Changed color
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : onRetry,
                    style: ElevatedButton.styleFrom( // Updated button style
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.white.withAlpha(20),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.white.withAlpha(30)),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white, // Changed color
                            ),
                          )
                        : Text('Retry', style: GoogleFonts.poppins( // Added GoogleFonts
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                            ),
                          )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}