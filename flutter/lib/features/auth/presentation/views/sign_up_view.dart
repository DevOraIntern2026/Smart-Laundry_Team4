import 'package:flutter/material.dart';
import '../widgets/sign_up_view_body.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(child: SignUpViewBody()),
    );
  }
}
