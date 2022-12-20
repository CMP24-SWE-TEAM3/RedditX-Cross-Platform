import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/add_post_model.dart';
import '../../../controllers/add_post_controller.dart';

class Rules extends StatelessWidget {
  const Rules({
    Key? key,
    required this.communityInAddPost,
  }) : super(key: key);

  ///The community that we will show its rules
  final CommunityInAddPost communityInAddPost;

  static const routeName = '/rules';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                key: const Key('close_rules_widget'),
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                ' Community rules',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          ///Horizontal grey line
          const Divider(
            color: Color.fromRGBO(135, 138, 140, 0.2),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              'Rules are different for each community.',
              softWrap: true,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              'Reviewing the rules can help tou be more successful when posting or commenting in this community.',
              softWrap: true,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          ///Numbered elapsed widgets community rules
          ...Provider.of<AddPostController>(context)
              .communityRulesWidget(communityInAddPost),

          ///Spacer th make the button at the bottom of the page
          const Spacer(),
          Center(
            child: TextButton(
              key: const Key('I_understand_button'),
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
                  vertical: 10,
                ),
                child: Text(
                  'I Understand',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
