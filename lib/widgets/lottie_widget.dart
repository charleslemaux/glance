import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationWidget extends StatelessWidget {
  final String animationPath;
  final double width;
  final double height;
  final bool repeat;
  final bool autoPlay;

  const LottieAnimationWidget({
    super.key,
    required this.animationPath,
    this.width = 200,
    this.height = 200,
    this.repeat = true,
    this.autoPlay = true,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animationPath,
      width: width,
      height: height,
      repeat: repeat,
      animate: autoPlay,
    );
  }
}