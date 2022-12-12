import 'package:flutter/material.dart';

class NotificationThree extends StatefulWidget{
  const NotificationThree({Key? key}): super(key:key);
  @override
  State<NotificationThree> createState()=>NotificationThreeState();
}

class NotificationThreeState extends State<NotificationThree>{
  @override
  Widget build(BuildContext context){
    return const Center(child:Text('Notification Three'),);
  }

}