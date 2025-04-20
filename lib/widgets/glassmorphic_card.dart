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
          Colors.white.withAlpha(10),
          Colors.white.withAlpha(5),
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withAlpha(50),
          Colors.white.withAlpha(20),
        ],
      ),
      child: child,
    );
  }
}