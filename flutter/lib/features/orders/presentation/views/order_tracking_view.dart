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
          title: Text('تتبع الطلب', style: AppTextStyle.heading(context)),
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
                  title: 'تتبع مراحل الطلب',
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
                        title: 'تم تأكيد الطلب',
                        time: '10:45 ص',
                        subtitle: 'تم استلام طلبك وتأكيده بنجاح',
                        state: StepState.done,
                      ),
                      TimelineStep(
                        title: 'تم استلام الملابس',
                        time: '11:15 ص',
                        subtitle: 'المندوب استلم ملابسك من منزلك',
                        state: StepState.done,
                      ),
                      TimelineStep(
                        title: 'المعالجة والغسيل الآن',
                        subtitle: 'جاري تنظيف ملابسك بالمعايير المعتمدة وبأعلى جودة',
                        state: StepState.active,
                      ),
                      TimelineStep(
                        title: 'جاهز للتوصيل والتغليف',
                        subtitle: 'في الانتظار',
                        state: StepState.pending,
                      ),
                      TimelineStep(
                        title: 'جاري التوصيل للمنزل',
                        subtitle: 'في الانتظار',
                        state: StepState.pending,
                      ),
                      TimelineStep(
                        title: 'تم التسليم بنجاح',
                        state: StepState.pending,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                const SectionTitle(title: 'مندوب الاستلام والتوصيل'),
                SizedBox(height: 10.h),
                CourierCard(
                  name: 'محمود الشافعي',
                  rating: 4.9,
                  reviewsCount: 186,
                  onMessage: () {}, // TODO: open chat
                  onCall: () {}, // TODO: launch dialer
                ),
                SizedBox(height: 20.h),
                const SectionTitle(title: 'تفاصيل الفاتورة والأصناف'),
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
                        name: 'رسوم التوصيل والاستلام',
                        isFee: true,
                      ),
                      Divider(height: 24.h, color: AppColors.border),
                      const TotalRow(label: 'الإجمالي النهائي', total: 105),
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
