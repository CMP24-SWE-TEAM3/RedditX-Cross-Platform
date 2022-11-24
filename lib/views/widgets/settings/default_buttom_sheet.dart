// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../Controller/Mobile_settings_controller.dart';

// void showDefaultBottomSheet(BuildContext context, String title, int itemCount,
//     List<IconData> icons, List<String> options, String source) {
//   showModalBottomSheet(
//       isDismissible: true,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       backgroundColor: Colors.white,
//       constraints: const BoxConstraints(maxWidth: 395),
//       context: context,
//       builder: (context) => Padding(
//           padding: const EdgeInsets.all(15),
//           child: Wrap(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, color: Colors.grey),
//                 ),
//               ),
//               const Divider(),
//               Consumer<SettingsMobileController>(
//                 builder: (context, value, child) => ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: itemCount,
//                   itemBuilder: (context, index) => ListTile(
//                     tileColor: Colors.white,
//                     title: InkWell(
//                       onTap: () {
//                         if (source == "notifications") {
//                           value.changeNotificationsType(options[index], index);
//                         } else if (source == "postView") {
//                           value.changeNotificationsType(options[index], index);
//                         } else if (source == "postSortBy") {
//                           if (index == 3) {
//                             //Navigator.pop(context);
//                             Scaffold.of(context)
//                                 .showBottomSheet((context) => Container(
//                                       color: Colors.red,
//                                       height: 100,
//                                     ));
//                           }
//                         }

//                         Navigator.pop(context);
//                       },
//                       child: Row(
//                         children: [
//                           Icon(icons[index]),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             options[index],
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           const Spacer(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )));
// }
