import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/add_post_controller.dart';

///Option that will be added when clicking [add option] button
class PollOption extends StatelessWidget {
  const PollOption({
    Key? key,
    required this.index,
  }) : super(key: key);

  ///index of the option
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.08,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(96, 158, 158, 158),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'Option ${index + 1}',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(120, 158, 158, 158),
                      fontSize: 13,
                    ),
                  ),
                  keyboardType: TextInputType.text, // any type of text
                  maxLines: 1,
                  textDirection: Provider.of<AddPostController>(
                    context,
                    listen: false,
                  ).isRTLTextField(Provider.of<AddPostController>(
                    context,
                  ).optionsController[index].text)
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  controller: Provider.of<AddPostController>(
                    context,
                  ).optionsController[index],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ),

              ///Delete button to delete that option
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Provider.of<AddPostController>(
                    context,
                    listen: false,
                  ).deleteItem(index);
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
