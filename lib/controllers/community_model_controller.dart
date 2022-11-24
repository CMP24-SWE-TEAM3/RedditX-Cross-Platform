import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/config/constants.dart';
import 'package:reddit/controllers/community_controller.dart';
import 'package:reddit/models/post_model.dart';
import 'package:reddit/services/community_services.dart';

class CommunityModelProvider with ChangeNotifier {
  bool mockData = iSMOCK;

  CommunityModelProvider() {
    //getPosts("art", "hot", [], 2, 40);
  }

  Future getPosts(String communityName, String sortType, List<dynamic> posts,int page, int limit) async {
    if (mockData) {
      postsList = postsListMock1;
      notifyListeners();
    } else {
      await getAPICommunityPosts(communityName, sortType, posts, page, limit);
      postsList = postsListAPI;
      //print(",,,,,,,,,,,,,, $postsList");
      notifyListeners();
    }
  }

 

  Future vote(String id, int dir,int index,BuildContext context)async
  {
    if(mockData)
    {
      if(dir==1||dir==0)
      {
        Provider.of<CommunityProvider>(context,listen: false).likePost(index);
        notifyListeners();
      }
      else
      {
        Provider.of<CommunityProvider>(context, listen: false).disLikePost(index);
        notifyListeners();
      }
  

    }
    else
    {
         final response=voteAPI(id, dir);
         if(response=="200")
         {
          if(dir==1)
          {

          }
          else if(dir==-1)
          {

          }
         }

         notifyListeners();
    }

  }
}
