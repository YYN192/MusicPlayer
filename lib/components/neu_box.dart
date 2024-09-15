import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;

  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surface;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Adjust shadow and highlight based on light/dark mode
    final shadowColor = isDarkMode
        ? Colors.black.withOpacity(0.3)  // Lighter shadow for dark mode
        : Colors.grey.shade500;          // Lighter shadow for light mode

    final highlightColor = isDarkMode
        ? Colors.white.withOpacity(0.15) // More visible highlight in dark mode
        : Colors.white.withOpacity(0.3); // Stronger highlight for light mode

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16), // Softer edges
        boxShadow: [
          // Softer shadow for depth
          BoxShadow(
            color: shadowColor,
            blurRadius: 25,               // Increased blur for a softer shadow
            offset: const Offset(10, 10), // Larger offset for depth
          ),
          // Highlight for the raised effect
          BoxShadow(
            color: highlightColor,
            blurRadius: 100,               // Increased blur for a stronger highlight
            offset: const Offset(-10, -10), // Larger offset for clarity
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
