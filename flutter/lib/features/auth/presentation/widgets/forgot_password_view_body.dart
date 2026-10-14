import 'package:flutter/material.dart';
import '../../../../core/widgets/app_top_bar.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AppTopBar(title: 'اعادة تعيين كلمة السر'),

          SizedBox(height: 16),

          _ResetIcon(),

          SizedBox(height: 12),

          Text(
            'نسيت كلمة المرور؟',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.0,
              color: Color(0xFF272727),
            ),
          ),

          SizedBox(height: 8),

          SizedBox(
            width: 320,
            child: Text(
              'لا تقلق! أدخل رقم هاتفك أو بريدك الإلكتروني المسجل وسنرسل لك رمز تحقق لإعادة تعيين كلمة المرور.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.25,
                color: Color(0xFF737373),
              ),
            ),
          ),

          // Tabs, phone field, button... next
        ],
      ),
    );
  }
}

/// Big light circle > white circle with the icon + small blue badge
class _ResetIcon extends StatelessWidget {
  const _ResetIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 112,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Outer light circle
          Container(
            width: 96,
            height: 96,
            margin: const EdgeInsets.only(top: 8, left: 8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE6EEFF),
            ),
            alignment: Alignment.center,
            // Inner white circle
            child: Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0D000000),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/Auth/reset_lock.png',
                width: 30,
                height: 30,
              ),
            ),
          ),

          // Small blue badge (top right)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: const Color(0xFF1A37FF),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/Auth/badge_laundry.png',
                width: 14,
                height: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
