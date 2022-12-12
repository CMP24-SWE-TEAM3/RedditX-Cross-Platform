import 'package:flutter/material.dart';

class NotificationOne extends StatefulWidget{
  const NotificationOne({Key? key}): super(key:key);
  @override
  State<NotificationOne> createState()=>NotificationOneState();
}

class NotificationOneState extends State<NotificationOne>{
  @override
  Widget build(BuildContext context){
    return const Center(child:Text('Notification One'),);
  }

}