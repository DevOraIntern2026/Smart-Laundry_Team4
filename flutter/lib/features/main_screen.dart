import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_laundry/core/widgets/app_bottom_nav_bar.dart';
import 'package:smart_laundry/features/profile/presentation/views/profile_view.dart';
import 'package:smart_laundry/features/services/presentation/views/services_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView(
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              
            currentIndex = value;
            });
          },
          children: [
            ServicesView(),
            ServicesView(),
            ServicesView(),
            ServicesView(),
            ProfileView(),
          ],
        ),
      ),

      bottomNavigationBar: AppBottomNavBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
            controller.animateToPage(currentIndex, duration: Duration(milliseconds: 500 ), curve: Curves.easeIn);
            debugPrint("$currentIndex");
          });
        },
      )
    );
  }
}
