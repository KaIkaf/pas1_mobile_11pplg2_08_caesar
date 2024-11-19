import 'package:get/get.dart';
import '../controller/dashboardcontroller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => DashboardControllers());
  }
}