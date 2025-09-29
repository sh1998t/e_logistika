import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedWidgets extends StatelessWidget {
  const AnimatedWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFFE53935), // red
      const Color(0xFF1E88E5), // blue
      const Color(0xFF43A047), // green
      const Color(0xFFFBC02D), // yellow
      const Color(0xFFF57C00), // orange
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(colors.length, (i) {
        final dot = Container(
          width: 14, height: 14,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(color: colors[i], shape: BoxShape.circle),
        );

        return dot
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .then(delay: (i * 120).ms)
            .scale(begin: const Offset(0.7, 0.7), end: const Offset(1.2, 1.2), duration: 400.ms)
            .fade(begin: 0.6, end: 1, duration: 400.ms);

      }),
    );
  }
}
