import '../config/constants.dart';
import '../services/add_post_service.dart';
import '../models/add_post_model.dart';

fillSubscriberCommunitiesList() async {
  if (iSMOCK) {
    communitiesInAddPost = communitiesInAddPostMock;
  } else {
    final res = await fetchMySubscribed();
    for (int i = 0; i < res.length; i++) {
      communitiesInAddPost.add(
        CommunityInAddPost(
          communityName: res[i]['_id'],
          communityIcon: res[i]['icon'],
          membersCount: res[i]['membersCnt'],
          nsfw: false,
        ),
      );
    }
  }
}

getCommunityRulesAPI(String communityName) async {
  if (iSMOCK) {
    communityRules = communityRulesMock;
  } else {
    List tempRules = await getAPICommunityRules(communityName);
    for (int i = 0; i < tempRules.length; i++) {
      communityRules.add(
        CommunityRuleModel(
          description: tempRules[i]['description'],
          title: tempRules[i]['title'],
        ),
      );
    }
  }
}

Future getCommunityFlairs(String communityName) async {
  if (iSMOCK) {
    flairs = communityFlairsMock;
  } else {
    List tempFlairs = await getAPICommunityFlairs(communityName);
    for (int i = 0; i < tempFlairs.length; i++) {
      flairs.add(
        Flair(
          flairBackGround: tempFlairs[i]['flairBackGround'],
          flairID: tempFlairs[i]['flairID'],
          flairText: tempFlairs[i]['flairText'],
          flairTextColor: tempFlairs[i]['flairTextColor'],
        ),
      );
    }
  }
}
