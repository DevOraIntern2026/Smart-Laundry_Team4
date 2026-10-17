import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_laundry/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_laundry/core/theme/app_colors.dart';
import 'package:smart_laundry/core/theme/app_text_styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: AppTextStyle.fontFamily,
            scaffoldBackgroundColor: AppColors.backgroundColor,
          ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
