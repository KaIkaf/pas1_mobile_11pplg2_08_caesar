
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mybutton.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Myimage.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mytext.dart';

class ProfileMenuTablet extends StatelessWidget {
  const ProfileMenuTablet({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: Column(
            children: [
              Row(
           children: [
             MyImage(
                imageName: 'assets/images/clogo.jpg',
                width: 200,
                height: 200,
                borderRadius: 200,
                isAsset: true,
              ),
              SizedBox(width: 10,),
              MyText(
                hintText: 'Kai',
                fontSize: 26,
                colors: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),

              ],
              ),
              
              
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    MyButton(
                      textButton: 'Achievement',
                      backgroundColor: Colors.orange,
                      textColor: Colors.white,
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(15),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      margin: const EdgeInsets.symmetric(vertical: 30),
                    ),
                    MyButton(
                      textButton: 'Settings',
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(15),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    MyButton(
                      textButton: 'Donations',
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(15),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    MyButton(
                      textButton: 'contact',
                      backgroundColor: Colors.purple,
                      textColor: Colors.white,
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(15),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
             
              MyButton(
                textButton: 'Logout',
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                textColor: Colors.white,
                onPressed: () {
                  Get.toNamed('/home');
                },
                borderRadius: BorderRadius.circular(20),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                margin: const EdgeInsets.only(top: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}