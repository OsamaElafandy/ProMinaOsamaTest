import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mygellary/core/constant.dart';
import '../../../controller/gellary_controller.dart';

class MyGellaryWidget extends StatelessWidget {
  const MyGellaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (GellaryController.isloading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      List<String> myImages = GellaryController.gellary.value;
      return GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: setWidth(context) * .064,
            mainAxisSpacing: setWidth(context) * .064,
          ),
          itemCount: myImages.length,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: myImages[index],
              imageBuilder: (context, imageProvider) => Container(
                height: 108,
                width: 108,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(isTablet(context) ? 35 : 20),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
              ),
              placeholder: (context, url) => Container(
                height: 108,
                width: 108,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            );
          });
    });
  }
}
