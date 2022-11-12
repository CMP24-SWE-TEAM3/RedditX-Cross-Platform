import 'dart:io';
import 'package:flutter/material.dart';
import 'package:reddit/View/Screens/post/Post_screen.dart';

import 'models/post/post_model.dart';
import 'models/post/comment_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DonWare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: post_screen(
        commentsNumber: postsList[0].commentsNumber,
        title: postsList[0].title,
        type: postsList[0].type,
        text: postsList[0].text,
        attachments: postsList[0].attachments,
        communityName: postsList[0].communityName,
        createdAt: postsList[0].createdAt,
        username: postsList[0].username,
        votesCount: postsList[0].votesCount),
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
          CircleAvatar(
            radius: 16.0,
            child: ClipRRect(
              child: Image.asset('assets/kareem.jpg'),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text('kareem'),
      ),
    );
  }
}
