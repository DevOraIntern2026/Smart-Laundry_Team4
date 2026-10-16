import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key, required this.image, required this.title, required this.subTtitle, this.onTap, this.tralingWidget});
  final String image;
  final String title;
  final String subTtitle;
  final void Function()? onTap;
  final Widget? tralingWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Expanded(
             child: Row(
               children: [
                 _iconBox(image),
                 SizedBox(width: 12,),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyle.profileTileHeader18(context),),
                    Text(subTtitle, style: AppTextStyle.profileSubHeader12(context),),
                  ],
                 ),
               ],
             ),
           ),
           Row(
             children: [
               tralingWidget??SizedBox.shrink(),
               IconButton(
                onPressed: onTap, icon: Icon(Icons.keyboard_arrow_left)),
             ],
           )
          ],
        ),
        SizedBox(height: 12.h,)
      ],
    );
  }

  Widget _iconBox(String image){
    return Container(
      width: 40.w,
      height: 40.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(12)
      ),
      child: SvgPicture.asset(image),
    );
  }
}