import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_laundry/core/utils/constants/app_assets/app_assets.dart';
import 'package:smart_laundry/core/utils/constants/app_strings/app_strings.dart';
import 'package:smart_laundry/core/widgets/custom_app_bar.dart';
import 'package:smart_laundry/features/profile/presentation/widgets/profile_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.profile,
        icon: AppAssets.profileIcon
      ),
      body: SafeArea(

        child: Column(          
          children: [
            SizedBox(height: 21,),
            ProfileHeader(
              image: AppAssets.profileAvatar,
              name: "أحمد عبدالله", 
              phoneNumber: "+20 10 1234 5678")
            
            ],
        ),
      ),
    );
  }
}