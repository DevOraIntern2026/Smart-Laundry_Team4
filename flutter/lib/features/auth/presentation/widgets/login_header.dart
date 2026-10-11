import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo
        Image.asset(
          'assets/images/welcome/nivo_logo_only.png',
          width: 118,
          fit: BoxFit.contain,
        ),

        // Smart Care Badge
        Container(
          padding: const EdgeInsets.only(
            top: 4,
            bottom: 4,
            left: 12,
            right: 12,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F7FF),
            borderRadius: BorderRadius.circular(9999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'العناية الذكية بالملابس',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1A37FF),
                  fontFamily: 'Tajawal',
                ),
              ),

              SizedBox(width: 6),
              Image.asset(
                'assets/images/Auth/badge_laundry.png',
                width: 14,
                height: 14,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          'مرحباً بعودتك!',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Color(0xFF272727),
            height: 1.0,
          ),
        ),

        const SizedBox(height: 5),

        // Subtitle
        const Text(
          'سجّل دخولك لمتابعة وطلب غسيل ملابسك بكل\nراحة وسرعة',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xFF737373),
            height: 1.4,
          ),
        ),

        const SizedBox(height: 28),
      ],
    );
  }
}
