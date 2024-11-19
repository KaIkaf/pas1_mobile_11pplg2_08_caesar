import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/api_register/register_page.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/bindings/bindings.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/controller/responsivecontroller.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/page/login_page.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/page/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ResponsiveController controllers =Get.put(ResponsiveController());
    return GetMaterialApp(
      initialRoute: '/home',
     getPages: [
      GetPage(name: '/home', page: () => LoginPage()),
       GetPage(name: '/register', page: () => RegisterPage()),
      GetPage(name: '/dashboard', page: () =>LayoutBuilder(builder: (context, constraints) {
          controllers.updateScreenWidth(constraints.maxWidth);
          return ResponsiveLayout();

      }),binding: MyBindings())
     ],
      
    );
  }
}

