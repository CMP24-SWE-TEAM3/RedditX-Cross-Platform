import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/add_post_controller.dart';

class AddPostScreenOne extends StatelessWidget {
  const AddPostScreenOne({super.key});

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
                      IconButton(
                        key: const Key('exit_communities_list'),
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          //Pop this screen
                        },
                      ),
                      const Text(
                        'Post to',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //Search
                ],
              ),
            ),
    );
  }
}
