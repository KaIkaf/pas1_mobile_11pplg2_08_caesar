
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/api_service_get.dart';
import '../model/post_model.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <PostModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiServiceGet().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}