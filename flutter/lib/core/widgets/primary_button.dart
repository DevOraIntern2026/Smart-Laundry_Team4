import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Primary call-to-action button used across the app (Fill x 51)
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
    this.borderColor,
    this.borderWidth = 1, this.textColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;

  /// Optional border. No border is drawn when null.
  final Color? borderColor;
  final double borderWidth;

  /// Optional icon shown after the label (on the left in RTL)
  final IconData? icon;

  static const double _radius = 16;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(_radius);

    return SizedBox(
      width: double.infinity,
      height: 51.h,
      child: Material(
        color: color ?? const Color(0xFFFE574F),
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: borderColor == null
              ? BorderSide.none
              : BorderSide(color: borderColor!, width: borderWidth),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: radius,
          child: Padding(
            // Horizontal only: the SizedBox already fixes the height.
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style:  TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      color: textColor?? Colors.white ,
                    ),
                  ),
                  if (icon != null) ...[
                    const SizedBox(width: 8),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Icon(icon, size: 20, color: textColor?? Colors.white),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}