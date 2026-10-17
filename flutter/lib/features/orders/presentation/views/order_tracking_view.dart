import 'package:flutter/material.dart' hide StepState;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/widgets/app_badge.dart';
import 'package:smart_laundry/core/widgets/app_card.dart';
import 'package:smart_laundry/core/widgets/section_title.dart';
import 'package:smart_laundry/features/orders/presentation/widgets/courier_card.dart';
import 'package:smart_laundry/features/orders/presentation/widgets/invoice_item_row.dart';
import 'package:smart_laundry/features/orders/presentation/widgets/order_status_header.dart';
import 'package:smart_laundry/features/orders/presentation/widgets/support_banner.dart';
import 'package:smart_laundry/features/orders/presentation/widgets/timeline_step.dart';
import 'package:smart_laundry/features/orders/presentation/widgets/total_row.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';

class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          centerTitle: true,
          leading: const BackButton(color: AppColors.darkblue),
          title: Text(AppStrings.orderTracking, style: AppTextStyle.heading(context)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OrderStatusHeader(
                  orderId: '#SL-9402',
                  time: 'اليوم 11:30 ص',
                  itemsCount: 3,
                  status: 'جاري الغسيل والتقييم في المغسلة',
                  eta: 'التسليم المتوقع: اليوم بين 01:00 م و 06:00 م',
                ),
                SizedBox(height: 20.h),
                SectionTitle(
                  title: AppStrings.trackOrderStages,
                  trailing: AppBadge(
                    label: 'منذ 3 ساعات',
                    background: AppColors.sunsetOrange,
                    foreground: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 10.h),
                 AppCard(
                  child: Column(
                    children: [
                      TimelineStep(
                        title: AppStrings.stepOrderConfirmed,
                        time: '10:45 ص',
                        subtitle: AppStrings.stepOrderConfirmedDesc,
                        state: StepState.done,
                      ),
                      TimelineStep(
                        title: AppStrings.stepClothesReceived,
                        time: '11:15 ص',
                        subtitle: AppStrings.stepClothesReceivedDesc,
                        state: StepState.done,
                      ),
                      TimelineStep(
                        title: AppStrings.stepProcessing,
                        subtitle: AppStrings.stepProcessingDesc,
                        state: StepState.active,
                      ),
                      TimelineStep(
                        title: AppStrings.stepReadyForDelivery,
                        subtitle: AppStrings.stepWaiting,
                        state: StepState.pending,
                      ),
                      TimelineStep(
                        title: AppStrings.stepDelivering,
                        subtitle: AppStrings.stepWaiting,
                        state: StepState.pending,
                      ),
                      TimelineStep(
                        title: AppStrings.stepDelivered,
                        state: StepState.pending,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                const SectionTitle(title: AppStrings.courierSection),
                SizedBox(height: 10.h),
                CourierCard(
                  name: 'محمود الشافعي',
                  rating: 4.9,
                  reviewsCount: 186,
                  onMessage: () {}, // TODO: open chat
                  onCall: () {}, // TODO: launch dialer
                ),
                SizedBox(height: 20.h),
                const SectionTitle(title: AppStrings.invoiceDetails),
                SizedBox(height: 10.h),
                AppCard(
                  child: Column(
                    children: [
                      const InvoiceItemRow(
                        name: 'قميص رجالي (غسيل وكي)',
                        quantity: 1,
                        price: 30,
                      ),
                      const InvoiceItemRow(
                        name: 'بطانية سرير (كبيرة) (تنظيف خاص)',
                        quantity: 1,
                        price: 75,
                      ),
                      const InvoiceItemRow(
                        name: AppStrings.deliveryFee,
                        isFee: true,
                      ),
                      Divider(height: 24.h, color: AppColors.border),
                      const TotalRow(label: AppStrings.finalTotal, total: 105),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                SupportBanner(onTap: () {}), // TODO: open support
              ],
            ),
          ),
        ),
      ),
    );
  }
}
