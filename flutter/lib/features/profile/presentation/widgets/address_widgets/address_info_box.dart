import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/features/profile/domain/address.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_widgets/courier_notes_box.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_widgets/info_row.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';


class AddressInfoBox extends StatelessWidget {
  final Address address;
  const AddressInfoBox({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.infoBox,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(
            icon: address.isDefault
                ? Icons.location_on_outlined
                : Icons.apartment_rounded,
            iconColor: AppColors.textGrey,
            child: Text(
              address.details,
              style: const TextStyle(
                fontSize: 14.5,
                height: 1.5,
                color: AppColors.textDark,
              ),
            ),
          ),
          const SizedBox(height: 10),
          InfoRow(
            icon: Icons.phone_rounded,
            iconColor: AppColors.green,
            child: Row(
              children: [
                const Text(
                  AppStrings.pickupPhone,
                  style: TextStyle(fontSize: 12, color: AppColors.textGrey),
                ),
                Text(
                  address.phone,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
          if (address.courierNotes != null) ...[
            const SizedBox(height: 10),
            CourierNotesBox(notes: address.courierNotes!),
          ],
        ],
      ),
    );
  }
}