import 'package:flutter/material.dart';

import '../../../controllers/post_comment.dart';

// ignore: must_be_immutable
class AddComment extends StatelessWidget {
  AddComment({super.key});
  static const routeName = '/AddComment';
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Add Comment'),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            key: const ValueKey('Close_button_addComment_page'),
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          );
        }),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 50.0, top: 10),
            child: Text(
              "Add Comment",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          TextButton(
            key: const ValueKey('post_button_addComment_page'),
            onPressed: () async {
              await postComment(/*postID*/ 'asdf', commentController);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            },
            child: const Text(
              "Post",
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          key: const ValueKey('addComment_text_field_addComment_page'),
          maxLines: null,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'Your comment',
            border: InputBorder.none,
            labelStyle: TextStyle(
              color: Colors.black,
            ),
          ),
          controller: commentController,
        ),
      ),
    );
  }
}
