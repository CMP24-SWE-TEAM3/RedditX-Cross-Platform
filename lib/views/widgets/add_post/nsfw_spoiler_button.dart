// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/add_post_controller.dart';

///Button to select whether the content is NSFW/Spoiler ot not
class NsfwSpoiler extends StatelessWidget {
  const NsfwSpoiler({
    Key? key,
    required this.nsfwOrSpoiler,
  }) : super(key: key);

  ///determine the button is NSFW or Spoiler
  final String nsfwOrSpoiler;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: Key(nsfwOrSpoiler),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            ///If the button is selected ==>the color will be black , else==>light grey
            return ((Provider.of<AddPostController>(context).selectedSRNSFW &&
                        (nsfwOrSpoiler == 'NSFW')) ||
                    (Provider.of<AddPostController>(context)
                            .selectedSRSpoiler &&
                        (nsfwOrSpoiler == 'Spoiler')))
                ? Colors.black
                : const Color.fromRGBO(0, 121, 211, 0.06);
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //to make the button RoundedRectangle
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            //Border side Color
            side: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
      onPressed: () {
        nsfwOrSpoiler == 'NSFW'
            ? Provider.of<AddPostController>(context).toggleNsfw()
            : Provider.of<AddPostController>(context).toggleSpoiler();
      },
      child: Row(
        children: [
          nsfwOrSpoiler == 'NSFW'
              ? const Icon(Icons.eighteen_up_rating)
              : const Icon(Icons.warning),
          Text(
            nsfwOrSpoiler,
            style: TextStyle(
              ///If the button is selected ==>the color will be white , else==>black
              color: ((Provider.of<AddPostController>(context).selectedSRNSFW &&
                          (nsfwOrSpoiler == 'NSFW')) ||
                      (Provider.of<AddPostController>(context)
                              .selectedSRSpoiler &&
                          (nsfwOrSpoiler == 'Spoiler')))
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
