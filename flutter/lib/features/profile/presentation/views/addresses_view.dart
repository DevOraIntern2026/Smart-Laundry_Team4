import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/widgets/custom_app_bar.dart';
import 'package:smart_laundry/features/profile/domain/address.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_popup.dart/address_popup.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_popup.dart/show_address_popup.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_widgets/address_card.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_widgets/section_header.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_widgets/wide_soft_button.dart';

class AddressesView extends StatelessWidget {
   AddressesView({super.key});

   final List _addresses = [
    Address(
      title: 'عنوان المنزل',
      area: 'المعادي الجديدة، القاهرة',
      details:
          'شقة ٤، الطابق الثاني، عمارة ١٤، شارع النصر، متفرع من شارع اللاسلكي، المعادي الجديدة',
      phone: '01023456789',
      courierNotes: 'المصعد يعمل. يرجى الاتصال هاتفياً قبل الوصول بربع ساعة.',
      icon: Icons.home_rounded,
      isDefault: true,
    ),
    Address(
      title: 'مكتب العمل',
      area: 'التجمع الخامس، القاهرة الجديدة',
      details: 'الطابق السادس، مبنى كابيتال بيزنس بارك، التجمع الخامس',
      phone: '01023456789',
      icon: Icons.business_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppAssets.welcomeLogo, width: 51.w, height: 51.h,),
        actions: [
          Row(children: [
            Text("تعديل عنواني"),
            IconButton(onPressed: (){
              context.pop();
            }, icon: Icon(Icons.keyboard_arrow_right))
          ],)
        ],
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: const EdgeInsets.all(14),
            children: [
              SectionHeader(
                title: 'العناوين المحفوظة',
                count: '${_addresses.length} عناوين',
              ),
              const SizedBox(height: 12),
              ..._addresses.map(
                (a) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: AddressCard(
                    address: a,
                    onEdit: () {},
                    onDelete: () {},
                    onSetDefault: a.isDefault ? null : () {},
                  ),
                ),
              ),
              WideSoftButton(
                label: 'إضافة عنوان جديد',
                icon: Icons.add_location_alt_outlined,
                onTap: () => showAddressPopup(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}