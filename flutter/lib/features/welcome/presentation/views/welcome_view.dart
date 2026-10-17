import 'package:flutter/material.dart';
import 'package:smart_laundry/features/auth/presentation/views/login_view.dart';
import '../widgets/feature_card.dart';
import '../../../../core/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import '../../../../core/widgets/blur_circle.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background blur circles
          const BlurCircle(
            left: 182,
            top: -95,
            size: Size(288, 288),
            color: AppColors.blurLightBlue,
          ),
          const BlurCircle(
            left: -97,
            top: 266,
            size: Size(320, 315.25),
            color: AppColors.blurBlue,
          ),
          const BlurCircle(
            left: 80,
            top: 590,
            size: Size(240, 240),
            color: AppColors.blurIndigo,
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
                      label: AppStrings.getStarted,
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
                color: AppColors.white,
                borderRadius: BorderRadius.circular(9999),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.languageShort,
                    style: TextStyle(fontSize: 12, color: AppColors.languageGrey),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.language, size: 16, color: AppColors.languageGrey),
                ],
              ),
            ),

            // Service status
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.darkblue100,
                borderRadius: BorderRadius.circular(9999),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: [
                  Icon(Icons.circle, size: 10, color: AppColors.mint),
                  SizedBox(width: 6),
                  Text(
                    AppStrings.serviceAvailable,
                    style: TextStyle(fontSize: 12, color: AppColors.black),
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
              AppStrings.welcomeAppName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyle.fontFamily,
                fontSize: 31,
                fontWeight: FontWeight.w700,
                height: 37 / 31,
                color: AppColors.deepNavy,
              ),
            ),

            const SizedBox(height: 4),

            // Slogan
            const Text(
              AppStrings.welcomeSlogan,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyle.fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 19 / 16,
                color: AppColors.secondaryColor,
              ),
            ),

            const SizedBox(height: 4),

            // Description
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 271),
              child: const Text(
                AppStrings.welcomeDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTextStyle.fontFamily,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 16 / 13,
                  color: AppColors.gray,
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
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowMedium,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: AppColors.shadowMedium,
                  offset: Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: -1,
                ),
              ],
            ),
            child: Image.asset(
              AppAssets.welcomeLogo,
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
                color: AppColors.aiBadge,
                borderRadius: BorderRadius.circular(9999),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: [
                  Icon(Icons.auto_awesome, size: 13.92, color: AppColors.white),
                  SizedBox(width: 4),
                  Text(
                    AppStrings.superIntelligence,
                    style: TextStyle(
                      color: AppColors.white,
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
            title: AppStrings.featureDeliveryTitle,
            subtitle: AppStrings.featureDeliverySubtitle,
          ),

          SizedBox(height: 8),

          // Card 2
          FeatureCard(
            icon: Icons.track_changes,
            title: AppStrings.featureTrackingTitle,
            subtitle: AppStrings.featureTrackingSubtitle,
          ),

          SizedBox(height: 8),

          // Card 3 (larger icon)
          FeatureCard(
            icon: Icons.psychology_outlined,
            iconSize: 30,
            flipIcon: true,
            title: AppStrings.featureAiTitle,
            subtitle: AppStrings.featureAiSubtitle,
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
        color: AppColors.darkblue50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Verified icon
            Icon(Icons.verified_outlined, size: 16, color: AppColors.mint),

            SizedBox(width: 8),
            // Guarantee text
            Flexible(
              child: Text(
                AppStrings.trustGuarantee,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: AppTextStyle.fontFamily,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  color: AppColors.deepNavy,
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
            fontFamily: AppTextStyle.fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.0,
            color: AppColors.gray,
          ),
          children: [
            const TextSpan(text: AppStrings.welcomeHaveAccount),
            TextSpan(
              text: AppStrings.login,
              style: const TextStyle(color: AppColors.primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
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
    fontFamily: AppTextStyle.fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.0,
    color: AppColors.gray,
  );

  static const _link = TextStyle(
    fontFamily: AppTextStyle.fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.0,
    color: AppColors.black,
  );

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      TextSpan(
        style: _base,
        children: [
          TextSpan(text: AppStrings.welcomeTermsPrefix),
          TextSpan(text: AppStrings.termsOfService, style: _link),
          TextSpan(text: AppStrings.andWord),
          TextSpan(text: AppStrings.privacyPolicy, style: _link),
        ],
      ),
    );
  }
}
