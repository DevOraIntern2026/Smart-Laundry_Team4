import 'package:flutter/material.dart';

class SignUpBanner extends StatelessWidget {
  const SignUpBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9E6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(
                'assets/images/Auth/banner_logo.png',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            // Title + description
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'انضم إلى نيفو',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      color: Color(0xFFE53935),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'واستمتع بأسهل تجربة غسيل وكوي فائقة العناية',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      color: Color(0xFF737373),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
