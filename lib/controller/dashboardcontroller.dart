import 'package:get/get.dart';

class DashboardControllers extends GetxController{
  var selectedindex = 0.obs;

 
  void changeMenu (int index){
    selectedindex.value = index;
  }
}