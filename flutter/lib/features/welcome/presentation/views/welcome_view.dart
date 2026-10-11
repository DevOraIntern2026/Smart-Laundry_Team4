import 'package:flutter/material.dart';
import '../widgets/feature_card.dart';
import '../../../../core/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import '../../../../core/widgets/blur_circle.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background blur circles
          const BlurCircle(
            left: 182,
            top: -95,
            size: Size(288, 288),
            color: Color(0x4DDFE0FF),
          ),
          const BlurCircle(
            left: -97,
            top: 266,
            size: Size(320, 315.25),
            color: Color(0x99E1E8FD),
          ),
          const BlurCircle(
            left: 80,
            top: 590,
            size: Size(240, 240),
            color: Color(0x33BCC2FF),
          ),

          // Screen content
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  _TopBar(),
                  SizedBox(height: 8),
                  _HeroSection(),
                  _FeaturesList(),
                  SizedBox(height: 32),

                  _TrustBanner(),
                  SizedBox(height: 8),

                  // width 358 inside the 393 frame (17.5 on each side)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.5),
                    child: PrimaryButton(
                      label: 'ابدأ الآن',
                      icon: Icons.arrow_forward,
                      onPressed: null,
                    ),
                  ),
                  SizedBox(height: 20),

                  _LoginPrompt(),
                  SizedBox(height: 16),
                  _TermsText(),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Top Bar
// ============================================================

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Language
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9999),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0D000000),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'EN',
                    style: TextStyle(fontSize: 12, color: Color(0xFF777777)),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.language, size: 16, color: Color(0xFF777777)),
                ],
              ),
            ),

            // Service status
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE6EEFF),
                borderRadius: BorderRadius.circular(9999),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: [
                  Icon(Icons.circle, size: 10, color: Color(0xFF20B486)),
                  SizedBox(width: 6),
                  Text(
                    'الخدمة متاحة الآن في مدينتك',
                    style: TextStyle(fontSize: 12, color: Color(0xFF272727)),
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

// ============================================================
// Hero Section
// ============================================================

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _LogoWithBadge(),
            const SizedBox(height: 1),

            // App name
            const Text(
              'نيفو',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 31,
                fontWeight: FontWeight.w700,
                height: 37 / 31,
                color: Color(0xFF01002F),
              ),
            ),

            const SizedBox(height: 4),

            // Slogan
            const Text(
              'غسيل أذكى، وقت أكثر لما تحب',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 19 / 16,
                color: Color(0xFF1A37FF),
              ),
            ),

            const SizedBox(height: 4),

            // Description
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 271),
              child: const Text(
                'تجربة عناية متطورة بملابسك تدار كلياً بأحدث تقنيات الفحص والجدولة التلقائية.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 16 / 13,
                  color: Color(0xFF737373),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// Logo + AI Badge
// ============================================================

class _LogoWithBadge extends StatelessWidget {
  const _LogoWithBadge();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 146,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Logo card
          Container(
            width: 112,
            height: 128,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: -1,
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/welcome/nivo_logo_only.png',
              fit: BoxFit.contain,
            ),
          ),

          // AI badge
          Positioned(
            top: 118,
            left: 40,
            child: Container(
              width: 79.7,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF2F5BFF),
                borderRadius: BorderRadius.circular(9999),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: [
                  Icon(Icons.auto_awesome, size: 13.92, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    'ذكاء فائق',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Features List
// ============================================================

class _FeaturesList extends StatelessWidget {
  const _FeaturesList();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 350,
      child: Column(
        children: [
          // Card 1
          FeatureCard(
            icon: Icons.local_shipping_outlined,
            title: 'استلام وتسليم مجاني من باب بيتك',
            subtitle: 'مندوبنا يصلك في الموعد المحدد بدقة فائقة',
          ),

          SizedBox(height: 8),

          // Card 2
          FeatureCard(
            icon: Icons.track_changes,
            title: 'أسعار شفافة وتتبع دقيق لحظة بلحظة',
            subtitle: 'راقب مراحل غسيل وكي ملابسك مباشرة من هاتفك',
          ),

          SizedBox(height: 8),

          // Card 3 (larger icon)
          FeatureCard(
            icon: Icons.psychology_outlined,
            iconSize: 30,
            flipIcon: true,
            title: 'خدمة ذكية مدعومة بالذكاء الاصطناعي',
            subtitle: 'تعرف على الأقمشة ومسارات العناية المثلى',
          ),
        ],
      ),
    );
  }
}
// ============================================================
// Trust Guarantee Banner
// ============================================================

class _TrustBanner extends StatelessWidget {
  const _TrustBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F7FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Verified icon
            Icon(Icons.verified_outlined, size: 16, color: Color(0xFF20B486)),

            SizedBox(width: 8),
            // Guarantee text
            Flexible(
              child: Text(
                'ضمان العناية التامة بنظافة وراحة أنسجتك بنسبة 100%',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  color: Color(0xFF01002F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ============================================================
// Login Prompt
// ============================================================

class _LoginPrompt extends StatelessWidget {
  const _LoginPrompt();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        textDirection: TextDirection.rtl,
        TextSpan(
          style: const TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.0,
            color: Color(0xFF737373),
          ),
          children: [
            const TextSpan(text: 'لديك حساب بالفعل؟ '),
            TextSpan(
              text: 'تسجيل الدخول',
              style: const TextStyle(color: Color(0xFFFE574F)),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: Add login navigation after Auth feature is merged.
                },
            ),
          ],
        ),
      ),
    );
  }
}
// ============================================================
// Terms Text
// ============================================================

class _TermsText extends StatelessWidget {
  const _TermsText();

  static const _base = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.0,
    color: Color(0xFF737373),
  );

  static const _link = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.0,
    color: Color(0xFF272727),
  );

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      TextSpan(
        style: _base,
        children: [
          TextSpan(text: 'بالبدء أنت توافق على '),
          TextSpan(text: 'شروط الخدمة', style: _link),
          TextSpan(text: ' و'),
          TextSpan(text: 'سياسة الخصوصية', style: _link),
        ],
      ),
    );
  }
}
