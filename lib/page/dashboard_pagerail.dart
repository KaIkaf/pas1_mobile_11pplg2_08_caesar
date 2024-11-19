import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/menus/favorite.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/menus/home_tablet.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/menus/profile_tablet.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mycolors.dart';
import '../controller/dashboardcontroller.dart';
import '../menus/profile_menu.dart';


class DashboardPageRail extends StatelessWidget {
  const DashboardPageRail({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardControllers navController = Get.find();
    final List<Widget> menus = [
      HomeMenuTablet(),FavoriteMenu(), ProfileMenuTablet()
    ];
    return Scaffold(
      body: Row(
        children: [
          Obx(() =>NavigationRail(
            selectedIndex: navController.selectedindex.value,
            onDestinationSelected: (int index) {
              navController.changeMenu(index);
            },
            selectedIconTheme: IconThemeData(color: redColor),
            unselectedIconTheme: IconThemeData(color: blackz),
            indicatorColor: Colors.white,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text(
                  "Home",
                  style: TextStyle(
                    color: navController.selectedindex.value == 0 ? redColor : hintColor ,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text(
                  "Favorite",
                  style: TextStyle(
                    color: navController.selectedindex.value == 2 ? redColor : hintColor,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text(
                  "Profile",
                  style: TextStyle(
                    color: navController.selectedindex.value == 3 ? redColor : hintColor,
                  ),
                ),
              ),

            ],
                         backgroundColor: Colors.white,
                 labelType: NavigationRailLabelType.all, 
            groupAlignment: 0.0,
          )
          ),
           Expanded(child: Obx(() {
                 return menus[navController.selectedindex.value];
           }))
        ],
      ),
    );
  }
}