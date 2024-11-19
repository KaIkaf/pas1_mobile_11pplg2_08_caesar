import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/controller/favoritecontroller.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mycolors.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Myimage.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mytext.dart';

class FavoriteMenu extends StatelessWidget {
  FavoriteController favoriteController =Get.put(FavoriteController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            MyImage(
              imageName: 'assets/images/premierl.png',
              width: 40,
              height: 40,
              borderRadius: 100,
              isAsset: true,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  hintText: 'Favorites',
                  fontSize: 20,
                  colors: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                MyText(
                  hintText: 'clubs',
                  fontSize: 12,
                  colors: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (favoriteController.tasks.isEmpty) {
            return const Center(
              child: MyText(
                hintText: 'No favorite teams added yet.',
                fontSize: 16,
                colors: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8, 
              ),
              itemCount: favoriteController.tasks.length,
              itemBuilder: (context, index) {
                final task = favoriteController.tasks[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyImage(
                        imageName: task.strBadge,
                        width: 80,
                        height: 80,
                        borderRadius: 8,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 8),
                      MyText(
                        hintText: task.strTeam,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        colors: Colors.black,
                      ),
                      const SizedBox(height: 8),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: MyText(
                                  hintText: "Konfirmasi Penghapusan",
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  colors: Colors.black,
                                ),
                                content: MyText(
                                  hintText:
                                      "Yakin ingin menghapus ${task.strTeam}?",
                                  fontSize: 16,
                                  colors: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: MyText(
                                      hintText: "Tidak",
                                      fontSize: 14,
                                      colors: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await favoriteController
                                          .deleteTask(task.id!);
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: MyText(
                                            hintText:
                                                '${task.strTeam} berhasil dihapus!',
                                            fontSize: 16,
                                            colors: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                          backgroundColor: Colors.green,
                                          duration:
                                              const Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                    child: MyText(
                                      hintText: "Ya",
                                      fontSize: 14,
                                      colors: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}