import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const CircleIcon({super.key, required this.icon, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.iconCircle,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.primary, size: size * 0.5),
    );
  }
}