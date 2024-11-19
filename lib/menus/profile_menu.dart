
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mybutton.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Myimage.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mytext.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: Column(
            children: [
              
              MyImage(
                imageName: 'assets/images/clogo.jpg',
                width: 200,
                height: 200,
                borderRadius: 200,
                isAsset: true,
              ),
              SizedBox(height: 10),
            
              MyText(
                hintText: 'Kai',
                fontSize: 26,
                colors: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  children: [
                    MyButton(
                      textButton: 'Achievement',
                      backgroundColor: Colors.orange,
                      textColor: Colors.white,
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(200),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      margin: EdgeInsets.zero,
                    ),
                    MyButton(
                      textButton: 'Settings',
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(200),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      margin: EdgeInsets.zero,
                    ),
                    MyButton(
                      textButton: 'Donation ',
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(200),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      margin: EdgeInsets.zero,
                    ),
                    MyButton(
                      textButton: 'contact',
                      backgroundColor: Colors.purple,
                      textColor: Colors.white,
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(200),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      margin: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
             
              MyButton(
                textButton: 'Logout',
                backgroundColor: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  Get.toNamed('/home');
                },
                borderRadius: BorderRadius.circular(20),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                margin: EdgeInsets.only(top: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}