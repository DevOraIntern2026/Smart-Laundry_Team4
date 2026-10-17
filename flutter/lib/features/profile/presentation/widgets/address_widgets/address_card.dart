import 'package:flutter/material.dart';
import 'package:smart_laundry/features/profile/domain/address.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_widgets/address_card_actions.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_widgets/address_card_header.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_widgets/address_info_box.dart';


class AddressCard extends StatelessWidget {
  final Address address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback? onSetDefault;

  const AddressCard({
    super.key,
    required this.address,
    required this.onEdit,
    required this.onDelete,
    this.onSetDefault,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          AddressCardHeader(address: address),
          const SizedBox(height: 12),
          AddressInfoBox(address: address),
          const SizedBox(height: 10),
          AddressCardActions(
            onEdit: onEdit,
            onDelete: onDelete,
            onSetDefault: onSetDefault,
          ),
        ],
      ),
    );
  }
}