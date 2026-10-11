import 'package:flutter/material.dart';

/// Primary call-to-action button used across the app (Fill x 51)
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;

  /// Optional icon shown before the label (on the right in RTL)
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 51,
      child: Material(
        color: const Color(0xFFFE574F),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      color: Colors.white,
                    ),
                  ),

                  if (icon != null) ...[
                    const SizedBox(width: 8),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Icon(icon, size: 20, color: Colors.white),
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
