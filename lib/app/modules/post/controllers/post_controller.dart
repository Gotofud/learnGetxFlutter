import 'package:get/get.dart';
import 'package:learn_getx/app/data/models/post.dart';
import 'package:learn_getx/app/service/post_service.dart';

class PostController extends GetxController {
  final PostService api = Get.put<PostService>(PostService());

  RxList posts = <Post>[].obs; 
  RxBool isLoading = true.obs; 
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await api.fetchPosts();

      if (response.statusCode == 200) {
        final data = (response.body as List)
            .map((e) => Post.fromJson(e))
            .toList();
        posts.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
