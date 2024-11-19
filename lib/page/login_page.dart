// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mytextfield.dart';
import '../controller/LoginController.dart';
import '../widget/Mytext.dart';



class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Image.asset(
              "assets/images/clogo.jpg",
              width: 250,
              height: 250,
            ),
            Center(
                child: MyText(
                  hintText: 'Cek club2 premier secara detaillll',
                  fontSize: 18,
                  colors: Colors.grey[700]!,
                  textAlign: TextAlign.center,
                )),
            SizedBox(height: 10),
           
            MyTextField(
              hintText: 'Username',
              controller: usernameController,
              icon: Icons.person_outline,
            ),

            MyTextField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: Icons.lock_outline,
            ),
            SizedBox(height: 16),
           
            Obx(() => ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blueAccent),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              onPressed: controller.isLoading.value
                  ? null
                  : () async {
                if (usernameController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: MyText(
                        hintText: "Nama dan password harus diisi!",
                        fontSize: 16,
                        colors: Colors.white,
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                } else {
                  await controller.login(usernameController.text,
                    passwordController.text);
                if (controller.loginStatus.value ==
                    "Login success") {
                  Get.toNamed('/dashboard');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: MyText(
                        hintText: controller.loginStatus.value,
                        fontSize: 16,
                        colors: Colors.white,
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
                }
              },
              child: controller.isLoading.value
                  ? CircularProgressIndicator(
                color: Colors.white,
              )
                  : MyText(
                hintText: "Login",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                colors: Colors.white,
              ),
            )),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 270),
              child: MyText(
                hintText: "Forgot Password?",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                colors: Colors.black,
              ),
            ),
            SizedBox(height: 100),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  hintText: "Don't have an account? ",
                  fontSize: 16,
                  colors: Colors.black,
                ),
                GestureDetector(
                  onTap: () {
                      Get.toNamed('/register'); 
                  },
                  child: MyText(
                    hintText: 'Sign Up',
                    fontSize: 16,
                    colors: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
         
            
          ],
        ),
      ),
    );
  }
}