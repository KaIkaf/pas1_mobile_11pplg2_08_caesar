import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pas1_mobile_11pplg2_08_caesar/page/dashboard_pagerail.dart';
import '../controller/responsivecontroller.dart';
import 'dashboard_page.dart';




class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout({super.key});

  final ResponsiveController responsiveController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (responsiveController.isMobile()) {
        return DashboardPage();
      } else if(responsiveController.isTablet()){
        return DashboardPageRail();
      }
      else{
        return Placeholder();
      }
    });
  }
}