import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class AddressType extends StatelessWidget {
   const AddressType({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(children: [
            Expanded(child: addressTypeItem(context, icon: Icons.home_outlined, title: "المنزل", isSelected: true,)),
            SizedBox(width: 8.w,),
            Expanded(child: addressTypeItem(context, icon: Icons.domain_outlined, title: "العمل")),
            SizedBox(width: 8.w,),
            Expanded(child: addressTypeItem(context,  icon: Icons.location_on_outlined, title: "أخرى")),
          ],);
  }

  Widget addressTypeItem(BuildContext context , {
    required IconData icon,
    required String title,
    bool isSelected = false,
    void Function()? onTap
  }){
 return   InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.darkblue50,
          borderRadius: BorderRadius.circular(12.r),
          border: isSelected? BoxBorder.all(width: 1, color: AppColors.darkblue600): null
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected? AppColors.darkblue600: AppColors.navyBlue1,),
            Text(title, style: AppTextStyle.f12w700(context, color: isSelected? AppColors.darkblue600: AppColors.navyBlue1),)
            
            ],
        ),
      ),
    );
  }
}