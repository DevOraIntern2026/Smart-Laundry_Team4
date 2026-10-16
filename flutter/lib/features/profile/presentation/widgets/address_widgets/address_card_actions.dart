import 'package:flutter/material.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_widgets/action_text_button.dart';
import 'package:smart_laundry/features/profile/presentation/constants/profile_strings.dart';

class AddressCardActions extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback? onSetDefault;

  const AddressCardActions({
    super.key,
    required this.onEdit,
    required this.onDelete,
    this.onSetDefault,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: onSetDefault == null
              ? const SizedBox.shrink()
              : ActionTextButton(
                  label: AppStrings.setAsDefault,
                  icon: Icons.check_circle_outline_rounded,
                  color: AppColors.textGrey,
                  onTap: onSetDefault!,
                ),
        ),
        Expanded(
          child: ActionTextButton(
            label: AppStrings.edit,
            icon: Icons.edit_outlined,
            color: AppColors.textGrey,
            onTap: onEdit,
          ),
        ),
        Expanded(
          child: ActionTextButton(
            label: AppStrings.delete,
            icon: Icons.delete_outline_rounded,
            color: AppColors.red,
            onTap: onDelete,
          ),
        ),
      ],
    );
  }
}