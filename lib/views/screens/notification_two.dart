import 'package:flutter/material.dart';

class NotificationTwo extends StatefulWidget{
  const NotificationTwo({Key? key}): super(key:key);
  @override
  State<NotificationTwo> createState()=>NotificationTwoState();
}

class NotificationTwoState extends State<NotificationTwo>{
  @override
  Widget build(BuildContext context){
    return const Center(child:Text('Notification Two'),);
  }

}