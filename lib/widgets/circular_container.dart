import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.child,
    required this.color,
    this.borderWidth,
    this.borderColor,
  });

  final Widget? child;
  final Color color;
  final double? borderWidth;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(width: borderWidth ?? 2, color: color),
      ),
      child: Center(child: child),
    );
  }
}
