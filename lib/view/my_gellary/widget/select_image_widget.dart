import 'package:flutter/material.dart';
import 'package:mygellary/core/constant.dart';

class SelectImageWidget extends StatelessWidget {
  final void Function()? selectFunction;
  final String imagePath;
  final String title;
  final bool isCamera;
  const SelectImageWidget(
      {super.key,
      this.selectFunction,
      required this.imagePath,
      required this.title,
      this.isCamera = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectFunction,
      child: Container(
        width: setWidth(context) * .45,
        height: setHeight(context) * .075,
        decoration: BoxDecoration(
            color: isCamera
                ? Color.fromRGBO(235, 246, 255, 1)
                : const Color.fromRGBO(239, 216, 249, 1),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imagePath),
            Text(title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: setFontSize(context) * .16,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              width: setWidth(context) * .02,
            )
          ],
        ),
      ),
    );
  }
}
