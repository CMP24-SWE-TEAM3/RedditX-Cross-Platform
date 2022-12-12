import 'package:flutter/material.dart';

class NotificationFive extends StatefulWidget{
  const NotificationFive({Key? key}): super(key:key);
  @override
  State<NotificationFive> createState()=>NotificationFiveState();
}

class NotificationFiveState extends State<NotificationFive>{
  @override
  Widget build(BuildContext context){
    return const Center(child:Text('Notification Five'),);
  }

}