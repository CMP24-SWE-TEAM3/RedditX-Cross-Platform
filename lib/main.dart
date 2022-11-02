import 'dart:io';
import 'package:flutter/material.dart';
import 'package:reddit/Screens/Post_screen.dart';

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
      home: _HomePage(),
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
