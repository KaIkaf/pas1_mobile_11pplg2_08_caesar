import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/menus/favorite.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/menus/home_mobile.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/menus/profile_menu.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mycolors.dart';
import '../controller/dashboardcontroller.dart';



class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardControllers dashboardControllers = Get.find();
    final List<Widget> menus = [HomeMenuMobile(),FavoriteMenu(), ProfileMenu()];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardControllers.selectedindex.value],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: blackz,
          selectedItemColor: redColor,
          currentIndex: dashboardControllers.selectedindex.value,
          onTap: dashboardControllers.changeMenu,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),

      );
    });
  }
}