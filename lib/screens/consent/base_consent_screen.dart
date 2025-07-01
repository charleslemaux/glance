import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_text_styles.dart';
import '../../widgets/app_button.dart';

abstract class BaseConsentScreen extends StatefulWidget {
  final String title;
  final String nextRoute;
  final bool isLastScreen;

  const BaseConsentScreen({
    super.key,
    required this.title,
    required this.nextRoute,
    this.isLastScreen = false,
  });

  @override
  BaseConsentScreenState createState() => BaseConsentScreenState();

  // Abstract methods to be implemented by subclasses
  Widget buildContent(BuildContext context, Animation<double> animation);
  String getButtonText();
  void onButtonPressed(BuildContext context);
}

class BaseConsentScreenState<T extends BaseConsentScreen> extends State<T>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // Start the animation when the screen is first displayed
    _animationController.forward();

    // Auto-navigate to next screen after delay if not the last screen
    if (!widget.isLastScreen) {
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          widget.onButtonPressed(context);
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
                              widget.title,
                              style: AppTextStyles.heading,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      
                      // Content Section - Implemented by subclasses
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: widget.buildContent(context, _fadeAnimation),
                        ),
                      ),
                      
                      // Footer Section with Button
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: AppButton(
                            text: widget.getButtonText(),
                            onPressed: () => widget.onButtonPressed(context),
                          ),
                        ),
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
}