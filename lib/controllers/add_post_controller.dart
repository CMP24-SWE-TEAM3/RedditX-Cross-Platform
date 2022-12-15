import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as international;

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

  ///when click on X button in add post
  exitAddPostScreen() {}
  nextButton() {}

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
        SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(96, 158, 158, 158),
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Option ${i + 1}',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(120, 158, 158, 158),
                          fontSize: 13,
                        ),
                      ),
                      keyboardType: TextInputType.text, // any type of text
                      maxLines: 1,
                      textDirection: isRTLTextField(optionsController[i].text)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      controller: optionsController[i],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      deleteItem(i);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      );
    }
    return moreOptions;
  }
}
