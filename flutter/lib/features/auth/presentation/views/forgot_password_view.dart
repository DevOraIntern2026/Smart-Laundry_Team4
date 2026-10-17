import 'package:flutter/material.dart';
import '../widgets/forgot_password_view_body.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(child: ForgotPasswordViewBody()),
    );
  }
}
