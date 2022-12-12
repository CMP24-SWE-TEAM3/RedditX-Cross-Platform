import 'package:flutter/material.dart';

class NotificationFour extends StatefulWidget{
  const NotificationFour({Key? key}): super(key:key);
  @override
  State<NotificationFour> createState()=>NotificationFourState();
}

class NotificationFourState extends State<NotificationFour>{
  @override
  Widget build(BuildContext context){
    return const Center(child:Text('Notification Four'),);
  }

}