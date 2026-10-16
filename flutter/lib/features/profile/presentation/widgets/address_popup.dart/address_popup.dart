import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/widgets/primary_button.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_popup.dart/address_popup_input_field.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_popup.dart/address_type.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/address_popup.dart/area_drop_down.dart';
import 'package:smart_laundry/features/profile/presentation/constants/profile_strings.dart';

class AddressPopup extends StatelessWidget {
  const AddressPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.addNewAddress, style: AppTextStyle.f18w700(context, color: AppColors.navyBlue),),
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.close))
            ],
          ),
          SizedBox(height: 12.h,),
          Text(AppStrings.addressType, style: AppTextStyle.f12w700(context, color: AppColors.navyBlue),),
          SizedBox(height: 12.h,),
          AddressType(),
          SizedBox(height: 12.h,),
          Text(AppStrings.governorateAndArea, style: AppTextStyle.f12w700(context, color: AppColors.navyBlue),),
          SizedBox(height: 12.h,),
          AreaDropdown(items: ["القاهرة - المعادي و حلوان", "الأسكندرية - سيدي جابر"]),
          SizedBox(height: 12.h,),
          Text(AppStrings.streetName, style: AppTextStyle.f12w700(context, color: AppColors.navyBlue),),
          SizedBox(height: 12.h,),
          AddressPopupInputField(hint: AppStrings.streetNameHint, icon: AppAssets.streetSign,),
          SizedBox(height: 12.h,),
          Text(AppStrings.landmarkAndNotes, style: AppTextStyle.f12w700(context, color: AppColors.navyBlue),),
          SizedBox(height: 12.h,),
          AddressPopupInputField(hint: AppStrings.landmarkAndNotesHint, isMultiline: true,),
          SizedBox(height: 12.h,),
          PrimaryButton(label: AppStrings.saveAddress, onPressed: (){}, icon:Icons.offline_pin_outlined,)

          



        ],
      ),
    );
  }
}