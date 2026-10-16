import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String count;

  const SectionHeader({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.bookmark_rounded, color: AppColors.primaryColor, size: 22),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.darkblue,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}