import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(
                Icons.arrow_back,
                size: 24,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'انشاء حساب',
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 24 / 18,
                color: Color(0xFF111827),
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/welcome/nivo_logo_only.png',
              width: 52,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
