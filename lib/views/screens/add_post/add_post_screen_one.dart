import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../controllers/add_post_controller.dart';

class AddPostScreenOne extends StatelessWidget {
  const AddPostScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<AddPostController>(context).isWeb

          ///WEB
          ? Container()

          ///App
          : SafeArea(
              child: Column(
                children: [
                  ///close button and 'Next Button'
                  Row(
                    children: [
                      IconButton(
                        key: const Key('exit_add_post'),
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Provider.of<AddPostController>(
                            context,
                            listen: false,
                          ).exitAddPostScreen(context);
                        },
                      ),

                      ///Spacer to locate the button at the end of the row
                      const Spacer(),
                      TextButton(
                        key: const Key('add_post_next_button'),
                        onPressed:

                            ///If the button is allowed to be clicked ==> call the [nextButton] function
                            Provider.of<AddPostController>(context).canGoNext
                                ? () {
                                    Provider.of<AddPostController>(
                                      context,
                                      listen: false,
                                    ).nextButton();
                                  }
                                : () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              ///If the button is allowed to be clicked ==>color is blue and text color is white
                              ///else ==> color is grey
                              return Provider.of<AddPostController>(context)
                                      .canGoNext
                                  ? Colors.blue
                                  : Colors.grey;
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            //to make the button RoundedRectangle
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Provider.of<AddPostController>(context)
                                    .canGoNext
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),

                  ///Title Line
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextField(
                      key: const Key('add_post_title'),
                      decoration: const InputDecoration(
                        filled: true, //to can assign filled color
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'An intersteing title',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(120, 158, 158, 158),
                          fontSize: 16,
                        ),
                      ),
                      keyboardType: TextInputType.text, // any type of text
                      maxLines: 1,
                      textDirection: Provider.of<AddPostController>(
                        context,
                        listen: false,
                      ).isRTLTextField(Provider.of<AddPostController>(context)
                              .addPostTitlecontroller
                              .text)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      controller: Provider.of<AddPostController>(context)
                          .addPostTitlecontroller,
                      onTap: () {
                        Provider.of<AddPostController>(
                          context,
                          listen: false,
                        ).onTabTitleTextField();
                      },
                      onTapOutside: (_) {
                        Provider.of<AddPostController>(context, listen: false)
                            .onTabOutsideTitleTextField();
                      },
                      onChanged: (_) {
                        Provider.of<AddPostController>(
                          context,
                          listen: false,
                        ).onChangeTitleTextField();
                      },
                    ),
                  ),
                  Provider.of<AddPostController>(context).isText

                      ///Add Text
                      ? TextField(
                          key: const Key('add_post_content'),
                          decoration: const InputDecoration(
                            filled: true, //to can assign filled color
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            hintText: 'Add optional body text',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(120, 158, 158, 158),
                              fontSize: 13,
                            ),
                          ),
                          keyboardType: TextInputType.text, // any type of text
                          maxLines: null,

                          ///Any number of lines
                          textDirection: Provider.of<AddPostController>(
                            context,
                            listen: false,
                          ).isRTLTextField(
                                  Provider.of<AddPostController>(context)
                                      .addPostTextcontroller
                                      .text)
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          controller: Provider.of<AddPostController>(context)
                              .addPostTextcontroller,
                          onTap: () {
                            Provider.of<AddPostController>(
                              context,
                              listen: false,
                            ).textTextFieldonTap();
                          },
                        )
                      : Provider.of<AddPostController>(context).isLink

                          ///Add Link
                          ? TextField(
                              key: const Key('add_link_content'),

                              ///Only allow English letters, numbers and dot
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-z A-Z 0-9 .]"))
                              ],
                              decoration: const InputDecoration(
                                filled: true, //to can assign filled color
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                hoverColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                hintText: 'URL',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(120, 158, 158, 158),
                                  fontSize: 16,
                                ),
                              ),
                              keyboardType:
                                  TextInputType.url, // any type of text
                              maxLines: 1,
                              textDirection: TextDirection.ltr,
                              controller:
                                  Provider.of<AddPostController>(context)
                                      .addPostLinkcontroller,
                              onTap: () {
                                Provider.of<AddPostController>(
                                  context,
                                  listen: false,
                                ).linkTextFieldonTap();
                              },
                              onChanged: (text) {
                                Provider.of<AddPostController>(
                                  context,
                                  listen: false,
                                ).linkTextFieldonChange(text);
                              },
                            )
                          : Provider.of<AddPostController>(context).isPoll

                              ///Add Poll
                              ? Row(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: TextField(
                                            decoration: const InputDecoration(
                                              filled:
                                                  true, //to can assign filled color
                                              fillColor: Colors.white,
                                              focusColor: Colors.white,
                                              hoverColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              hintText:
                                                  'Add optional body text',
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    120, 158, 158, 158),
                                                fontSize: 13,
                                              ),
                                            ),
                                            keyboardType: TextInputType
                                                .text, // any type of text
                                            maxLines: 1,
                                            textDirection: Provider.of<
                                                    AddPostController>(
                                              context,
                                              listen: false,
                                            ).isRTLTextField(Provider.of<
                                                            AddPostController>(
                                                        context)
                                                    .addPollFirstLinkcontroller
                                                    .text)
                                                ? TextDirection.rtl
                                                : TextDirection.ltr,
                                            controller:
                                                Provider.of<AddPostController>(
                                                        context)
                                                    .addPollFirstLinkcontroller,
                                            onTap: () {
                                              Provider.of<AddPostController>(
                                                context,
                                                listen: false,
                                              ).pollTextFieldonTap();
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: TextField(
                                            decoration: const InputDecoration(
                                              filled:
                                                  true, //to can assign filled color
                                              fillColor: Color.fromARGB(
                                                  96, 158, 158, 158),
                                              focusColor: Colors.white,
                                              hoverColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              hintText: 'Option 1',
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    120, 158, 158, 158),
                                                fontSize: 13,
                                              ),
                                            ),
                                            keyboardType: TextInputType
                                                .text, // any type of text
                                            maxLines: 1,
                                            textDirection: Provider.of<
                                                    AddPostController>(
                                              context,
                                              listen: false,
                                            ).isRTLTextField(Provider.of<
                                                            AddPostController>(
                                                        context)
                                                    .optionsController[0]
                                                    .text)
                                                ? TextDirection.rtl
                                                : TextDirection.ltr,
                                            controller:
                                                Provider.of<AddPostController>(
                                                        context)
                                                    .optionsController[0],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: TextField(
                                            decoration: const InputDecoration(
                                              filled:
                                                  true, //to can assign filled color
                                              fillColor: Color.fromARGB(
                                                  96, 158, 158, 158),
                                              focusColor: Colors.white,
                                              hoverColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              hintText: 'Option 2',
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    120, 158, 158, 158),
                                                fontSize: 13,
                                              ),
                                            ),
                                            keyboardType: TextInputType
                                                .text, // any type of text
                                            maxLines: 1,
                                            textDirection:
                                                Provider.of<AddPostController>(
                                              context,
                                              listen: false,
                                            ).isRTLTextField(Provider.of<
                                                        AddPostController>(
                                              context,
                                            ).optionsController[1].text)
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                            controller:
                                                Provider.of<AddPostController>(
                                                        context)
                                                    .optionsController[1],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          child: ListView(
                                            shrinkWrap: true,
                                            children:
                                                Provider.of<AddPostController>(
                                                        context)
                                                    .buildMoreOptions(context),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,

                                          ///[Add option] button
                                          child: TextButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith<Color?>(
                                                (Set<MaterialState> states) {
                                                  return const Color.fromARGB(
                                                      96, 158, 158, 158);
                                                },
                                              ),
                                            ),
                                            onPressed: () {
                                              Provider.of<AddPostController>(
                                                context,
                                                listen: false,
                                              ).addOption(context);
                                            },
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.add,
                                                  color: Color.fromARGB(
                                                      120, 158, 158, 158),
                                                ),
                                                Text(
                                                  '  Add option',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        120, 158, 158, 158),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Provider.of<AddPostController>(context).isImage

                                  ///Add Image
                                  ? SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      child: Provider.of<AddPostController>(
                                              context,
                                              listen: false)
                                          .viewSelectedImages(),
                                    )
                                  : Provider.of<AddPostController>(context)
                                          .isVideo

                                      ///Add Video
                                      ? Provider.of<AddPostController>(
                                          context,
                                          listen: false,
                                        ).viewSelectedVideo()

                                      ///Spacer to make the next widget in the end of the column
                                      : const Spacer(),
                  const Spacer(),
                  //if the text field are tapped==> show the icons as one row
                  //else ==> show them as a column with icons and text
                  Provider.of<AddPostController>(context).isTapped ||
                          Provider.of<AddPostController>(context).secondTapped
                      ? Row(
                          children: [
                            Expanded(
                              //[GestureDetector] to be tapped
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AddPostController>(
                                    context,
                                    listen: false,
                                  ).addImageClicked();
                                },
                                key: const Key(
                                  'add_image_',
                                ),
                                child: const Icon(
                                  Icons.image,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AddPostController>(
                                    context,
                                    listen: false,
                                  ).addVideoClicked();
                                },
                                key: const Key(
                                  'add_video_',
                                ),
                                child: const Icon(
                                  Icons.play_circle_outline_rounded,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AddPostController>(
                                    context,
                                    listen: false,
                                  ).addTextClicked();
                                },
                                key: const Key(
                                  'add_text_',
                                ),
                                child: const Icon(
                                  Icons.file_copy_outlined,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AddPostController>(
                                    context,
                                    listen: false,
                                  ).addLinkClicked();
                                },
                                key: const Key(
                                  'add_link_',
                                ),
                                child: const Icon(
                                  Icons.link,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AddPostController>(
                                    context,
                                    listen: false,
                                  ).addPollClicked();
                                },
                                key: const Key(
                                  'add_poll_',
                                ),
                                child: const Icon(
                                  Icons.poll,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                elevation: 5,
                                borderOnForeground: false,
                                color: Colors.white,
                                shadowColor: Colors.grey,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Provider.of<AddPostController>(
                                          context,
                                          listen: false,
                                        ).addImageClicked();
                                      },
                                      key: const Key(
                                        'add_image',
                                      ),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.image,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '  Image',
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Provider.of<AddPostController>(
                                          context,
                                          listen: false,
                                        ).addVideoClicked();
                                      },
                                      key: const Key(
                                        'add_video',
                                      ),
                                      child: Row(children: const [
                                        Icon(
                                          Icons.play_circle_outline_rounded,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          '  Video',
                                        ),
                                      ]),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Provider.of<AddPostController>(
                                          context,
                                          listen: false,
                                        ).addTextClicked();
                                      },
                                      key: const Key(
                                        'add_text',
                                      ),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.file_copy_outlined,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '  Text',
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Provider.of<AddPostController>(
                                          context,
                                          listen: false,
                                        ).addLinkClicked();
                                      },
                                      key: const Key(
                                        'add_link',
                                      ),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.link,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '  Link',
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Provider.of<AddPostController>(
                                          context,
                                          listen: false,
                                        ).addPollClicked();
                                      },
                                      key: const Key(
                                        'add_poll',
                                      ),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.poll,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '  Poll',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
    );
  }
}
