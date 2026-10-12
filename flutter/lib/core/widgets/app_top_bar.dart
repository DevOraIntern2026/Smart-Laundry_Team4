import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            // Back arrow
            GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(
                Icons.arrow_back,
                size: 24,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(width: 12),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 24 / 18,
                color: Color(0xFF111827),
              ),
            ),

            const Spacer(),

            // Logo
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
