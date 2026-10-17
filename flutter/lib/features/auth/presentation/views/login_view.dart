import 'package:flutter/material.dart';
import '../../../../core/widgets/blur_circle.dart';
import '../widgets/login_view_body.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const double _designWidth = 393;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.sizeOf(context).width / _designWidth;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 21.5 * scale,
            top: 0,
            width: 347 * scale,
            height: 778 * scale,
            child: const ClipRect(
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  // Circle 1: pink
                  BlurCircle(
                    left: -40,
                    top: 80,
                    size: Size(160, 160),
                    color: AppColors.blurPink,
                    blur: 40,
                  ),

                  // Circle 2: light blue
                  BlurCircle(
                    left: 203,
                    top: -48,
                    size: Size(192, 192),
                    color: AppColors.blurLightBlue,
                    blur: 64,
                  ),
                ],
              ),
            ),
          ),

          // Screen content
          const SafeArea(child: LoginViewBody()),
        ],
      ),
    );
  }
}
