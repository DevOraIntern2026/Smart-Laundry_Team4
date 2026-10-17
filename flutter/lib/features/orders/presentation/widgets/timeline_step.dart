import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

enum StepState { done, active, pending }

/// One row of the order-tracking timeline (dot + connector + content).
class TimelineStep extends StatelessWidget {
  const TimelineStep({
    super.key,
    required this.title,
    required this.state,
    this.subtitle,
    this.time,
    this.isLast = false,
  });

  final String title;
  final String? subtitle;
  final String? time;
  final StepState state;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final isActive = state == StepState.active;
    final isDone = state == StepState.done;

    final titleColor = switch (state) {
      StepState.pending => AppColors.white500,
      StepState.active => AppColors.primaryColor,
      StepState.done => AppColors.darkblue,
    };

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 32.w,
            child: Column(
              children: [
                _StepDot(state: state),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2.w,
                      color: isDone ? AppColors.darkblue600 : AppColors.border,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 14.h),
              child: Container(
                padding: isActive ? EdgeInsets.all(12.w) : EdgeInsets.zero,
                decoration: isActive
                    ? BoxDecoration(
                        color: AppColors.sunsetOrange,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColors.primaryColor.withValues(alpha: 0.4),
                        ),
                      )
                    : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: AppTextStyle.f14w400(
                              context,
                              color: titleColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (time != null)
                          Text(
                            time!,
                            style: AppTextStyle.mediumTitle11(
                              context,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                      ],
                    ),
                    if (subtitle != null) ...[
                      SizedBox(height: 3.h),
                      Text(
                        subtitle!,
                        style: AppTextStyle.f12w500(
                          context,
                          color: AppColors.white500,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  const _StepDot({required this.state});

  final StepState state;

  @override
  Widget build(BuildContext context) {
    final (Color bg, IconData icon) = switch (state) {
      StepState.done => (AppColors.darkblue600, Icons.check),
      StepState.active => (
        AppColors.primaryColor,
        Icons.local_laundry_service_outlined,
      ),
      StepState.pending => (AppColors.border, Icons.check),
    };

    return CircleAvatar(
      radius: 14.r,
      backgroundColor: bg,
      child: Icon(icon, size: 16.w, color: AppColors.white),
    );
  }
}
