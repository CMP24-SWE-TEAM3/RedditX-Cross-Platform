


import 'post/post_model.dart';
import 'user_model.dart';

class CommunityService {
  List<PostModel> testPostsList = postsList;
  List<UserModel> testUsersList = users;

  Future<List<PostModel>> getPosts()async
  {
    await Future.delayed(const Duration(seconds: 1));
    return testPostsList;
  }
}
