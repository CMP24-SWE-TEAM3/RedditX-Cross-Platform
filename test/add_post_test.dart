import 'package:flutter_test/flutter_test.dart';
import 'package:search_project/controllers/add_post_controller.dart';

void main() {
  late AddPostController sut;

//stup method will run before each and every test
  setUp(() {
    sut = AddPostController();
  });
  test('initial values are correct', () {
    expect(sut.canGoNext, false);
    expect(sut.isTapped, false);
    expect(sut.secondTapped, false);
    expect(sut.isImage, false);
    expect(sut.isText, false);
    expect(sut.isVideo, false);
    expect(sut.isLink, false);
    expect(sut.showMore, false);
    expect(sut.selectedSRNSFW, false);
    expect(sut.selectedSRSpoiler, false);
    expect(sut.communityLoading, false);

    expect(sut.flairindex, -1);
    expect(sut.flairInitialIndex, -1);

    expect(sut.images, []);
    expect(sut.selectedImages, []);

    expect(sut.communityID, '');
  });

  group('RTL function works well', () {
    test('on typing Aeabic in the Text Field ==> text direction is RTL', () {
      bool isRTLText = sut.isRTLTextField('دنيا');
      expect(isRTLText, true);
    });

    test('on typing English in the Text Field ==> text direction is LTR', () {
      bool isRTLText = sut.isRTLTextField('Flutter');
      expect(isRTLText, false);
    });
  });

  group('Tapping functions works well', () {
    test('on tapping title Text Field', () {
      sut.onTabTitleTextField();
      expect(sut.isTapped, true);
    });
    test('on tapping text Text Field', () {
      sut.textTextFieldonTap();
      expect(sut.isTapped, true);
    });
    test('on tapping link Text Field', () {
      sut.linkTextFieldonTap();
      expect(sut.isTapped, true);
    });
    test('on tapping poll Text Field', () {
      sut.pollTextFieldonTap();
      expect(sut.isTapped, true);
    });
    test('on tapping outside title Text Field', () {
      sut.onTabOutsideTitleTextField();
      expect(sut.isTapped, false);
    });
  });

  group('clicking icons functions works well', () {
    test('on clicking text', () {
      sut.addTextClicked();
      expect(sut.isText, true);
      expect(sut.isPoll, false);
      expect(sut.isImage, false);
      expect(sut.isVideo, false);
      expect(sut.isLink, false);
      expect(sut.isTapped, true);
      expect(sut.secondTapped, true);
    });
    test('on clicking image', () {
      sut.addImageClicked();
      expect(sut.isText, false);
      expect(sut.isText, false);
      expect(sut.isPoll, false);
      expect(sut.isImage, true);
      expect(sut.isVideo, false);
      expect(sut.isLink, false);
      expect(sut.isTapped, true);
      expect(sut.secondTapped, true);
    });
    test('on clicking video', () {
      sut.addVideoClicked();
      expect(sut.isText, false);
      expect(sut.isPoll, false);
      expect(sut.isImage, false);
      expect(sut.isVideo, true);
      expect(sut.isLink, false);
      expect(sut.isTapped, true);
      expect(sut.secondTapped, true);
    });
    test('on clicking link', () {
      sut.addLinkClicked();
      expect(sut.isText, false);
      expect(sut.isPoll, false);
      expect(sut.isImage, false);
      expect(sut.isVideo, false);
      expect(sut.isLink, true);
      expect(sut.isTapped, true);
      expect(sut.secondTapped, true);
    });
    test('on clicking poll', () {
      sut.addPollClicked();
      expect(sut.isText, false);
      expect(sut.isPoll, true);
      expect(sut.isImage, false);
      expect(sut.isVideo, false);
      expect(sut.isLink, false);
      expect(sut.isTapped, true);
      expect(sut.secondTapped, true);
    });
  });
  test('Apply flair', () {
    sut.flairInitialIndex = 2;
    sut.applyFlair();
    expect(sut.flairindex, 2);
  });

  test('Set community name', () {
    sut.setCommunityName('aabb');
    expect(sut.communityID, 'aabb');
  });

  test('Show more', () {
    sut.showMoreFunc();
    expect(sut.showMore, true);
  });

  test('toddle spoiler', () {
    sut.selectedSRSpoiler = false;
    sut.toggleSpoiler();
    expect(sut.selectedSRSpoiler, true);
  });

  test('toggle nsfw', () {
    sut.selectedSRNSFW = false;
    sut.toggleNsfw();
    expect(sut.selectedSRNSFW, true);
  });
}
