import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/features/services/presentation/widgets/order_confirmed_widgets/appointment_time.dart';
import 'package:smart_laundry/features/services/presentation/widgets/order_confirmed_widgets/confirmation_header.dart';
import 'package:smart_laundry/features/services/presentation/widgets/order_confirmed_widgets/time_line.dart';

class OrderConfirmed extends StatelessWidget {
  const OrderConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConfirmationHeader(),
                  SizedBox(height: 12.h,),
                  TimeLine(),
                  SizedBox(height: 16.h,),
                  AppointmentTime()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}