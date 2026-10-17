import 'package:flutter/material.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text(AppStrings.splashPlaceholder)));
  }
}
