import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as international;
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:video_player/video_player.dart';
import 'dart:async';
import '../models/add_post_model.dart';
import '../services/add_post_service.dart';
import '../styles/custom_icons.dart';
import '../views/widgets/add_post/community_rules.dart';
import '../views/widgets/add_post/my_communities_data.dart';
import '../views/widgets/add_post/pick_image_or_video_button.dart';
import '../views/widgets/add_post/poll_option.dart';
import 'add_post_service_model_controller.dart';
import 'package:hexcolor/hexcolor.dart';

class AddPostController with ChangeNotifier {
  ///Whether the platform is web or android
  ///web==> true , App==> false
  bool isWeb = false; //!(defaultTargetPlatform == TargetPlatform.android);
  ///Whether the content is entered and 'Next' button can be clicked
  bool canGoNext = false;

  ///Whether the title text field is tapped
  bool isTapped = false;

  ///Whether the content text field is tapped
  bool secondTapped = false;

  ///Whether the the content is poll
  bool isPoll = false;

  ///Whether the the content is image
  bool isImage = false;

  ///Whether the the content is text
  bool isText = false;

  ///Whether the the content is video
  bool isVideo = false;

  ///Whether the the content is link
  bool isLink = false;

  ///Controller of post title
  TextEditingController addPostTitlecontroller = TextEditingController();

  ///Controller of text content

  TextEditingController addPostTextcontroller = TextEditingController();

  ///Controller of link content
  TextEditingController addPostLinkcontroller = TextEditingController();

  ///Controller of poll title
  TextEditingController addPollFirstLinkcontroller = TextEditingController();

  ///Controllers of poll options
  List<TextEditingController> optionsController = [
    TextEditingController(),
    TextEditingController(),
  ];

  ///List of images inside image picker function
  List<Asset> images = [];

  ///List of images to be displayed and sent if the user selects images
  List<Asset> selectedImages = [];

  ///Video file if the user selects video
  XFile video = XFile('');

  ///Whether the [Show more] button im communities list is clicked or not
  bool showMore = false;

  ///whether the post will be nsfw or not
  bool selectedSRNSFW = false;

  ///whether the post will be spoiler or not
  bool selectedSRSpoiler = false;

  int flairindex = -1;
  int flairInitialIndex = -1;
  String communityID = '';

  bool communityLoading = false;

  applyFlair() {
    flairindex = flairInitialIndex;
    notifyListeners();
  }

  setCommunityName(String communityName) {
    communityID = communityName;
    notifyListeners();
  }

  ///when click on X button in add post
  exitAddPostScreen(context) {
    if (addPostTitlecontroller.text == '' &&
        addPostTextcontroller.text == '' &&
        addPostLinkcontroller.text == '' &&
        addPollFirstLinkcontroller.text == '') {
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Discard post submission?'),
            actions: [
              TextButton(
                onPressed: () {
                  ///pop the dialog and the add post screen
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  ///Pop the dialog only
                  Navigator.pop(context);
                },
                child: const Text('Discard'),
              ),
            ],
          );
        },
      );
    }
  }

  ///when click on [Next] button in add post
  nextButton() async {
    await fillSubscriberCommunitiesList();
  }

  ///When tap the text field
  onTabTitleTextField() {
    ///Whether the text field is tapped or not
    isTapped = true;
    notifyListeners();
  }

  ///When exit tap the text field
  onTabOutsideTitleTextField() {
    ///Whether the text field is tapped or not
    isTapped = false;
    notifyListeners();
  }

  ///When title text field content changes
  onChangeTitleTextField() {
    ///  Detects whether to allow clicking on 'Next' button or not
    /// if title is not empty and the URL is valid if the content is URL ==> allow go next
    canGoNext = addPostTitlecontroller.text.isEmpty ||

            ///valid link that contains '.' followed by at least 2 charcters
            (isLink &&
                !(addPostLinkcontroller.text.contains('.') &&
                    addPostLinkcontroller.text.indexOf('.') <
                        addPostLinkcontroller.text.length - 2))
        ? false
        : true;
    notifyListeners();
  }

  ///Detects whether the text will be written LTR or RTL
  isRTLTextField(text) {
    bool isRTLText = international.Bidi.detectRtlDirectionality(

            ///[international.Bidi.detectRtlDirectionality] function from [intl.dart]
            text //input text
            )
        ? true
        : false;
    return isRTLText;
  }

  ///When the content is text ==> isText=true and other flags are false
  addTextClicked() {
    isText = true;
    isPoll = false;
    isImage = false;
    isVideo = false;
    isLink = false;
    secondTapped = true;
    isTapped = true;
    canGoNext = addPostTitlecontroller.text.isEmpty ? false : true;
    notifyListeners();
  }

  ///When the content is image ==> isImage=true and other flags are false
  addImageClicked() {
    isText = false;
    isPoll = false;
    isImage = true;
    isVideo = false;
    isLink = false;

    isTapped = true;
    secondTapped = true;
    canGoNext = addPostTitlecontroller.text.isEmpty ? false : true;
    notifyListeners();
  }

  ///When the content is video ==> isVideo=true and other flags are false
  addVideoClicked() {
    isText = false;
    isPoll = false;
    isImage = false;
    isVideo = true;
    isLink = false;

    isTapped = true;
    secondTapped = true;
    canGoNext = addPostTitlecontroller.text.isEmpty ? false : true;
    notifyListeners();
  }

  ///When the content is link ==> isLink=true and other flags are false
  addLinkClicked() {
    isText = false;
    isPoll = false;
    isImage = false;
    isVideo = false;
    isLink = true;

    isTapped = true;
    secondTapped = true;
    canGoNext = false;
    notifyListeners();
  }

  ///When the content is poll ==> isPoll=true and other flags are false
  addPollClicked() {
    isText = false;
    isPoll = true;
    isImage = false;
    isVideo = false;
    isLink = false;

    isTapped = true;
    secondTapped = true;
    canGoNext = addPostTitlecontroller.text.isEmpty ? false : true;
    notifyListeners();
  }

  ///When text content text field is tapped
  textTextFieldonTap() {
    isTapped = true;
    notifyListeners();
  }

  ///When poll title text field is tapped
  pollTextFieldonTap() {
    isTapped = true;
    notifyListeners();
  }

  ///When link content text field is tapped
  linkTextFieldonTap() {
    isTapped = true;
    notifyListeners();
  }

  ///When the link content change checks it is valid URL
  linkTextFieldonChange(text) {
    ///  Detects whether to allow clicking on 'Next' button or not
    /// if title is not empty and the URL is valid if the content is URL ==> allow go next
    canGoNext = addPostTitlecontroller.text.isEmpty ||

            ///valid link that contains '.' followed by at least 2 charcters
            !(addPostLinkcontroller.text.contains('.') &&
                addPostLinkcontroller.text.indexOf('.') <
                    addPostLinkcontroller.text.length - 2)
        ? false
        : true;
    notifyListeners();
  }

  ///When clicking [Add option] button in poll
  addOption(context) {
    ///The max. number of options are 6
    if (optionsController.length < 6) {
      ///add controller to the option in the options controllers list
      optionsController.add(
        TextEditingController(),
      );
      notifyListeners();
    }
  }

  ///When deleting poll option
  deleteItem(i) {
    optionsController.removeAt(i);
    notifyListeners();
  }

  ///Added options text fields
  List<Widget> buildMoreOptions(context) {
    List<Widget> moreOptions = [];
    for (int i = 2; i < optionsController.length; i++) {
      moreOptions.add(
        PollOption(index: i),
      );
    }
    return moreOptions;
  }

  ///Select images from gallery or camera
  ///max no. of selected images are 20
  Future<void> pickImages() async {
    final selected = await MultiImagePicker.pickImages(
      maxImages: 20,
      //to be able to select from camera or gallery
      enableCamera: true,
      //store selected images in [images]
      selectedAssets: images,
      materialOptions: const MaterialOptions(
        selectionLimitReachedText: 'you can select only up to 20 images',
        autoCloseOnSelectionLimit: false,
      ),
    );
    selectedImages.addAll(selected);
    notifyListeners();
  }

  ///ListView that shows selected images horizontally
  ListView viewSelectedImages() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(

          ///if the selected images are less than 20 ==>view images and add a pick button to ba able to add more images
          ///if the items are 20 ==> view images only
          selectedImages.length < 20
              ? selectedImages.length + 1
              : selectedImages.length, (index) {
        if (index < selectedImages.length) {
          ///[index < selectedImages.length] means it is an image not the pick button
          Asset asset = selectedImages[index];

          ///view the image as a square assist
          return AssetThumb(
            asset: asset,
            width: 200,
            height: 200,
          );
        } else {
          ///the button that picks more images if images are less than 20
          return const PickButton(isImage: true);
        }
      }),
    );
  }

  ///Pick video from gallery
  Future<void> pickvideo() async {
    ImagePicker imagePicker = ImagePicker();
    video =
        await imagePicker.pickVideo(source: ImageSource.gallery) ?? XFile('');
    notifyListeners();
  }

  ///Show picked video
  Widget viewSelectedVideo() {
    if (video.path != '') {
      print('=================================================${video.path}');

      ///if there is a selected video
      ///palying a video from an assest
      /* VideoPlayerController controller =
          VideoPlayerController.asset(video.path);
      return SizedBox(
        width: 200,
        height: 200,
        child: FittedBox(
          fit: BoxFit.fill,
          child: VideoPlayer(controller),
        ),
      );*/
      return Container();
    } else {
      ///Button to pick video if there isn't a selected video
      return const PickButton(isImage: false);
    }
  }

  ///Show user's subscribed communities
  List<CommunityDataAddPost> mySubscribedCommunities() {
    ///List of community data widget
    List<CommunityDataAddPost> mySubscribed = [];
    int endIndex = 0;

    ///if the user clicked [Show More] button then show all communities
    ///if the user didn't click [Show More] button then show max of 5 communities
    if (showMore || communitiesInAddPost.length <= 5) {
      endIndex = communitiesInAddPost.length;
    } else {
      endIndex = 5;
    }
    for (int i = 0; i < endIndex; i++) {
      mySubscribed.add(
        CommunityDataAddPost(
          communityInAddPost: communitiesInAddPost[i],
        ),
      );
    }
    return mySubscribed;
  }

  ///When [Show More] button is clicked make [showMore] flag true
  showMoreFunc() {
    showMore = true;
    notifyListeners();
  }

  openFlair(String communityName) async {
    communityLoading = true;
    notifyListeners();
    await getCommunityFlairs(communityName);
    communityLoading = false;
    notifyListeners();
  }

  List<dynamic> buildFlairsScreen() {
    if (communityLoading) {
      return [
        const Center(
          child: CircularProgressIndicator(),
        ),
      ];
    } else {
      ///List of rules to be showed for the user when click on [Rules] button
      List<Widget> flairsList = [];
      flairsList.add(
        RadioListTile(
          title: const Text(
            'None',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          value: "-1",
          groupValue: 'Flair',
          onChanged: (value) {
            flairInitialIndex = -1;
            notifyListeners();
          },
        ),
      );
      for (int i = 0; i < flairs.length; i++) {
        flairsList.add(
          RadioListTile(
            title: Container(
              margin: const EdgeInsets.only(
                left: 5,
              ),
              padding: const EdgeInsets.all(
                2,
              ),
              decoration: BoxDecoration(
                color: HexColor(
                  flairs[i].flairTextColor == ''
                      ? '#ffffff'
                      : flairs[i].flairBackGround,
                ).withOpacity(
                  1,
                ),
                //rounded rectangle shape
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                ///Flair text
                flairs[i].flairText,
                style: TextStyle(
                  color: HexColor(
                    flairs[i].flairTextColor == ''
                        ? '#000000'
                        : flairs[i].flairTextColor,
                  ),
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ),
            value: "$i",
            groupValue: 'Flair',
            onChanged: (value) {
              flairInitialIndex = i;
              notifyListeners();
            },
          ),
        );
      }
      return flairsList;
    }
  }

  sendPost(context) async {
    List<File> attachements = [];
    List attachementType = [];
    await submitPost(
      selectedSRNSFW,
      selectedSRSpoiler,
      addPostTitlecontroller.text,
      addPostTextcontroller.text,
      (flairindex == -1) ? '' : flairs[flairindex].flairText,
      (flairindex == -1) ? '' : flairs[flairindex].flairTextColor,
      (flairindex == -1) ? '' : flairs[flairindex].flairBackGround,
      (flairindex == -1) ? '' : flairs[flairindex].flairID,
      communityID,
      attachements,
      attachementType,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: const Key('posted'),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 5),
        content: Row(
          children: const [
            Icon(CustomIcons.reddit),
            Expanded(
              child: Text(
                style: TextStyle(
                  color: Colors.black,
                ),
                '  Successfully Posted',
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///When the user toggle the state of [NSFW] while adding post
  toggleNsfw() {
    selectedSRNSFW = !selectedSRNSFW;
    notifyListeners();
  }

  ///When the user toggle the state of [Spoiler] while adding post
  toggleSpoiler() {
    selectedSRSpoiler = !selectedSRSpoiler;
    notifyListeners();
  }

  getCommunityRules(String communityName) async {
    communityLoading = true;
    notifyListeners();
    await getCommunityRulesAPI(communityName);
    communityLoading = false;
    notifyListeners();
  }

  ///returns list of rules to be showed for the user when click on [Rules] button
  List<dynamic> communityRulesWidget(CommunityInAddPost communityInAddPost) {
    if (communityLoading) {
      return [
        const Center(
          child: CircularProgressIndicator(),
        ),
      ];
    } else {
      ///List of rules to be showed for the user when click on [Rules] button
      List<Widget> communityRulesList = [];
      for (int i = 0; i < communityRules.length; i++) {
        communityRulesList.add(
          CommunityRules(
            communityInAddPost: communityInAddPost,
            index: i,
          ),
        );
      }
      return communityRulesList;
    }
  }
}
