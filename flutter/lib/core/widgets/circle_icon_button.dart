import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Small tappable rounded icon button with a soft tinted background.
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12.r);
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: radius,
        ),
        child: Icon(icon, color: color, size: 20.w),
      ),
    );
  }
}
