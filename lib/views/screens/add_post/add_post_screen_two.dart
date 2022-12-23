import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/add_post_controller.dart';

class AddPostScreenTwo extends StatelessWidget {
  const AddPostScreenTwo({super.key});

  static const routeName = '/addPostScreenTwo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<AddPostController>(context).isWeb

          ///WEB
          ? Container()

          ///App
          : SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      ///Close button that close the screen
                      IconButton(
                        key: const Key('exit_communities_list'),
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        '  Post to',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  ///My subscribed communities
                  ...Provider.of<AddPostController>(context, listen: false)
                      .mySubscribedCommunities(),
                  const SizedBox(height: 5),
                  if (!Provider.of<AddPostController>(context).showMore)

                    ///[Show More] button
                    Center(
                      child: TextButton(
                        key: const Key('show_more'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              return Colors.white;
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                            'Show More',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 3, 136, 245),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Provider.of<AddPostController>(
                            context,
                            listen: false,
                          ).showMoreFunc();
                        },
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
