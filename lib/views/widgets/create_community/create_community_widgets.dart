import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/create_community_controller.dart';

///label of create community screen
class CreateCommunityLabel extends StatelessWidget {
  const CreateCommunityLabel({Key? key, required this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      color: Colors.white,
      child: Row(
        children: [
          Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

///create community sheet tile of create community screen
class CreateCommunitySheetTile extends StatelessWidget {
  const CreateCommunitySheetTile(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.index,
      required this.leadingIcon,
      required context})
      : super(key: key);
  final String? title;
  final String? subTitle;
  final int? index;
  final Icon leadingIcon;

  @override
  Widget build(context) {
    return ListTile(
      leading: leadingIcon,
      title: Text(title!),
      subtitle: Text(subTitle!),
      onTap: () => Provider.of<CreateCommunityViewModelController>(
        context,
        listen: false,
      ).changeCommunityTypeIndex(index, context),
    );
  }
}
