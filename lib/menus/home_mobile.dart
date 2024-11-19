import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/adapter.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/controller/favoritecontroller.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/controller/postcontroller.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/model/modelpremier.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mycolors.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Myimage.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mytext.dart';

class HomeMenuMobile extends StatelessWidget {
     final PostController postController = Get.put(PostController());
  final FavoriteController favoriteController = Get.put(FavoriteController());



  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyImage(
              imageName: 'assets/images/premierl.png',
              width: 70,
              height: 40,
              borderRadius: 100,
              isAsset: true,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  hintText: 'EPL',
                  fontSize: 20,
                  colors: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  hintText: 'Informations',
                  fontSize: 15,
                  colors: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final post = postController.postList[index];
            return AdapterLiga(
              post: post,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyImage(
                                imageName: post.strBadge,
                                width: 100,
                                height: 100,
                                borderRadius: 8,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 16),
                              MyText(
                                hintText: post.strTeam,
                                fontSize: 24,                               
                                fontWeight: FontWeight.w700,
                                colors: Colors.black,
                              ),
                              const SizedBox(height: 12),
                              MyText(
                                hintText: post.strDescriptionEN ?? 'No description available.',
                                fontSize: 16,                              
                                fontWeight: FontWeight.w400,
                                colors: Colors.black,
                              ),
                              const SizedBox(height: 12),
                              MyText(
                                hintText: 'Stadium: ${post.strStadium}',
                                fontSize: 16,                               
                                fontWeight: FontWeight.w400,
                                colors: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              onFavorite: () {
                favoriteController.addTask(ModelPremier(
                  strTeam: post.strTeam,
                   strStadium: post.strStadium,
                      strBadge: post.strBadge,
                        strTeamShort: post.strTeamShort ?? '',
                         strLocation: post.strLocation ?? '',
                           strDescriptionEN: post.strDescriptionEN ?? '',
                            isCompleted: false,
                ));
              },
            );
          },
        );
      }),
    );
  }
}