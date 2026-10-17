import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class InvoiceItemRow extends StatelessWidget {
  const InvoiceItemRow({
    super.key,
    required this.name,
    this.quantity,
    this.price,
    this.isFee = false,
  });

  final String name;
  final int? quantity;
  final num? price;

  /// Fee rows (delivery...) show a delivery icon instead of a quantity.
  final bool isFee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          if (isFee)
            Icon(Icons.delivery_dining, size: 18.w, color: AppColors.white500)
          else
            Text(
              '${quantity ?? 1}x',
              style: AppTextStyle.f12w500(
                context,
                color: AppColors.white500,
              ),
            ),
          SizedBox(width: 8.w),
          Expanded(child: Text(name, style: AppTextStyle.f12w500(context))),
          if (price != null)
            Text(
              '$price ج.م',
              style: AppTextStyle.f12w500(
                context,
                fontWeight: FontWeight.w700,
              ),
            ),
        ],
      ),
    );
  }
}
