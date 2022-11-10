import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Widgets/bottm_sheet.dart';
import '../Widgets/sign_up_bar.dart';
import 'choose_username.dart';
import 'interests.dart';
import 'temphome.dart';

class ChooseProfilePicture extends StatefulWidget {
  const ChooseProfilePicture({super.key});
  static const routeName = '/ChooseProfilePicture';

  @override
  State<ChooseProfilePicture> createState() => _ChooseProfilePictureState();
}

class _ChooseProfilePictureState extends State<ChooseProfilePicture> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    Future<void> takephoto() async {
      PermissionStatus camera = await Permission.camera.request();
      if (camera == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
      PermissionStatus storage = await Permission.storage.request();
      if (storage == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
      final pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
      );
      setState(() {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path);
        }
      });
    }

    Future<void> chooseImage() async {
      PermissionStatus storage = await Permission.storage.request();
      if (storage == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path);
        }
      });
    }

    final mediaQuery = MediaQuery.of(context);
    final dynamic appBar =
        buildAppBar(text: 'Skip', function: () => skip(context));
    final heightScreen = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);
    final widthScreen = (mediaQuery.size.width);
    final padding = heightScreen * 0.03;

    void submit(ctx) {
      print('sending data to back end' +
          (heightScreen * widthScreen * 0.0001).toString());
      if (kIsWeb) {
        Navigator.of(ctx).pop();
        Navigator.of(ctx).pop();
      }
      Navigator.of(ctx).pop();
      Navigator.of(ctx).pushReplacementNamed(Home.routeName, arguments: {});
    }

    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: padding,
                      left: padding,
                      bottom: heightScreen * 0.01,
                    ),
                    child: const Text(
                      'Set Your Profile Picture',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: heightScreen * 0.03,
                    ),
                    child: const Text(
                      'This is how people will see you on Reddit.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: heightScreen * 0.03,
                    ),
                    child: const Text(
                      '(You can Change it later if you\'d like.)',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (kIsWeb) ? widthScreen * 0.5 : double.infinity,
                    height: (kIsWeb) ? heightScreen * 0.5 : heightScreen * 0.7,
                    child: Center(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: (_imageFile != null)
                                ? (kIsWeb)
                                    ? Image.network(
                                        'https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600w-1714666150.jpg')
                                    : CircleAvatar(
                                        radius: widthScreen * 0.45,
                                        child: CircleAvatar(
                                          radius: (widthScreen * 0.45),
                                          backgroundImage: Image.file(
                                            _imageFile!,
                                            fit: BoxFit.cover,
                                          ).image,
                                        ),
                                      )
                                : FittedBox(
                                    fit: BoxFit.contain,
                                    child: CircleAvatar(
                                      radius: widthScreen * 0.4,
                                      backgroundColor: Colors.white,
                                      backgroundImage: const AssetImage(
                                        'assets/images/defaultuser.png',
                                      ),
                                    ),
                                  ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: heightScreen * 0.1,
                                right: heightScreen * 0.1,
                              ),
                              child: InkWell(
                                onTap: (kIsWeb)
                                    ? () => chooseImage()
                                    : () => showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: heightScreen * 0.2,
                                              child: BottomSheetProfilePicture(
                                                  takephoto, chooseImage),
                                            );
                                          },
                                        ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.teal,
                                  size: (kIsWeb)
                                      ? 60
                                      : heightScreen * widthScreen * 0.0002,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: heightScreen * 0.02),
                child: ElevatedButton(
                  onPressed: () => submit(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Save and Continue',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void skip(context) {
  Navigator.of(context).pop();
}
