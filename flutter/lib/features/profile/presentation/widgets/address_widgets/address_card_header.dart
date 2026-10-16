import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/widgets/app_badge.dart';
import 'package:smart_laundry/features/profile/domain/address.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_widgets/circle_icon.dart';

class AddressCardHeader extends StatelessWidget {
  final Address address;
  const AddressCardHeader({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleIcon(icon: address.icon),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                address.area,
                style: const TextStyle(fontSize: 13, color: AppColors.textGrey),
              ),
            ],
          ),
        ),
        address.isDefault
            ? const AppBadge(
                label: 'العنوان الافتراضي',
                background: AppColors.iconCircle,
                foreground: AppColors.primary,
                icon: Icons.check_circle_rounded,
              )
            : const AppBadge(
                label: 'عنوان ثانوي',
                background: AppColors.secondaryBadgeBg,
                foreground: AppColors.textGrey,
              ),
      ],
    );
  }
}