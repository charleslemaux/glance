import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassmorphicCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double borderRadius;
  final double blur;
  final double border;

  const GlassmorphicCard({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.borderRadius = 20,
    this.blur = 20,
    this.border = 2,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width,
      height: height,
      borderRadius: borderRadius,
      blur: blur,
      alignment: Alignment.center,
      border: border,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFF1DEC9).withAlpha(40), // New palette: Lightest shade with alpha
          const Color(0xFFF1DEC9).withAlpha(25), // New palette: Lightest shade with alpha
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFA4907C).withAlpha(70), // New palette: Medium shade with alpha
          const Color(0xFFA4907C).withAlpha(40), // New palette: Medium shade with alpha
        ],
      ),
      child: child,
    );
  }
}