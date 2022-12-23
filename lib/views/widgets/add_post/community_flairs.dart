// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/add_post_controller.dart';

class CommunityFlairs extends StatelessWidget {
  const CommunityFlairs({
    Key? key,
  }) : super(key: key);

  ///The community that we will show its rules
  static const routeName = '/communityFlairs';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                key: const Key('back_flairs_widget'),
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                ' Post Flair',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          ...Provider.of<AddPostController>(
            context,
            listen: false,
          ).buildFlairsScreen(),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return Colors.blue;
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //to make the button RoundedRectangle
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      //Border side Color
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    //if the text is longer(Following and Joined case) ==> make the padding cmaller
                    horizontal: 8.0,
                  ),
                  child: Text(
                    'Cancel ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 5,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return Colors.blue;
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //to make the button RoundedRectangle
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      //Border side Color
                      side: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    //if the text is longer(Following and Joined case) ==> make the padding cmaller
                    horizontal: 8.0,
                  ),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  Provider.of<AddPostController>(
                    context,
                    listen: false,
                  ).applyFlair();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
