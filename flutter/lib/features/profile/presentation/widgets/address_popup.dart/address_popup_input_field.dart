import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';

class AddressPopupInputField extends StatelessWidget {
  AddressPopupInputField({super.key, required this.hint, this.isMultiline = false, this.icon});
  final String hint;
  bool isMultiline ;
  final String? icon;


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none
            
          ),
          prefixIcon: icon != null? SvgPicture.asset(icon!, width: 10.w, height: 10.h,): null,
          filled: true,
          fillColor: AppColors.darkblue50,
          hint: Text(hint, style: AppTextStyle.f14w400(context, color: AppColors.gray500),
          maxLines: !isMultiline?1: 3,
          overflow: TextOverflow.ellipsis,
          ),
          
          
        ),
      ),
    );
  }
}