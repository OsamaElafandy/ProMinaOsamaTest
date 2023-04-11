import 'package:flutter/material.dart';
import 'package:mygellary/core/constant.dart';
import 'package:mygellary/view/my_gellary/widget/select_image_widget.dart';

class DialogImageWidget extends StatelessWidget {
  final void Function()? selectImageFromGallery;
  final void Function()? selectImageFromCamera;
  const DialogImageWidget(
      {super.key, this.selectImageFromGallery, this.selectImageFromCamera});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          height: setHeight(context) * .265,
          width: setWidth(context) * .75,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade900.withOpacity(.5),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectImageWidget(
                selectFunction: selectImageFromGallery,
                imagePath: 'assets/images/gallery.png',
                title: 'Gallery',
              ),
              SelectImageWidget(
                  selectFunction: selectImageFromCamera,
                  imagePath: 'assets/images/camera.png',
                  title: 'Camera',
                  isCamera: true)
            ],
          ),
        ),
      ),
    );
  }
}
