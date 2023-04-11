import 'package:flutter/material.dart';
import 'package:mygellary/core/constant.dart';

class ActionButton extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final void Function()? onTap;
  const ActionButton({super.key, this.imagePath, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: setHeight(context) * .05,
          width: setWidth(context) * .33,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(imagePath!),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  title!,
                  style: TextStyle(fontSize: setFontSize(context) * .11),
                ),
              ),
            ),
          ])),
    );
  }
}
