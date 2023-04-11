import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mygellary/view/my_gellary/widget/action_button.dart';
import 'package:mygellary/view/my_gellary/widget/dialog_image_widget.dart';
import 'package:mygellary/view/my_gellary/widget/my_gellary_widget.dart';
import 'package:mygellary/view/my_gellary/widget/welcome_text.dart';
import '../../controller/gellary_controller.dart';
import '../../core/constant.dart';
import '../../data/gellary_service.dart';

class MyGellary extends StatefulWidget {
  static const String routeName = '/MyGellary';
  const MyGellary({super.key});

  @override
  State<MyGellary> createState() => _MyGellaryState();
}

class _MyGellaryState extends State<MyGellary> {
  final ImagePicker picker = ImagePicker();
  @override
  void initState() {
    GellaryService.getName();
    GellaryController.getGellary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(children: [
            Image.asset(
              'assets/images/gellary_back.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: setWidth(context) * .075,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Obx(() {
                      if (GellaryService.name.value == '') {
                        return const WelcomeText(
                          myName: '',
                        );
                      }
                      String myName = GellaryService.name.value;
                      return WelcomeText(
                        myName: myName,
                      );
                    }),
                  ),
                  SizedBox(
                    height: setHeight(context) * .02,
                  ),
                  SizedBox(
                    height: setHeight(context) * .135,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionButton(
                              imagePath: 'assets/images/log_out.png',
                              title: 'logout',
                              onTap: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(width: setWidth(context) * .08),
                          ActionButton(
                              imagePath: 'assets/images/upload.png',
                              title: 'upload',
                              onTap: () {
                                showGeneralDialog(
                                    context: context,
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return DialogImageWidget(
                                          selectImageFromCamera:
                                              selectImageFromCamera,
                                          selectImageFromGallery:
                                              selectImageFromGallery);
                                    });
                              }),
                        ]),
                  ),
                  const Expanded(child: MyGellaryWidget())
                ],
              ),
            )
          ]),
        ));
  }

  selectImageFromGallery() async {
// Pick an image.
    log("selectImageFromGallery");
    final XFile? gallery = await picker.pickImage(source: ImageSource.gallery);
    showSnakBarWithAction(gallery);
  }

  selectImageFromCamera() async {
    log("selectImageFromCamera");
// Capture a photo.
    final XFile? camera = await picker.pickImage(source: ImageSource.camera);
    showSnakBarWithAction(camera);
  }

  showSnakBarWithAction(XFile? file) {
    GellaryController.uploadImage(file!.path).then((isSend) {
      if (isSend) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Image Uploaded Successfully')));
        GellaryController.getGellary();
      } else {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Image Uploaded Failed')));
      }
    });
  }
}
