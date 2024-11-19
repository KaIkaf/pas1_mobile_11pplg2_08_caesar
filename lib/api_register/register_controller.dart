
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/api_register/register_model.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/api_register/register_service.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var registerStatus = "".obs;

  final RegisterService _registerService = RegisterService();

  Future<void> register(
      String username, String password, String fullName, String email) async {
    isLoading.value = true;
    try {
      final RegisterResponseModel response =
      await _registerService.register(username, password, fullName, email);
      registerStatus.value = response.message;

      if (response.status) {
        Get.offNamed('/home'); 
      } else {
        throw (response.message);
      }
    } catch (e) {
      registerStatus.value = "Error: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }
}