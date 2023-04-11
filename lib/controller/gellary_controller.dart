import 'dart:developer';

import 'package:get/get.dart';
import 'package:mygellary/data/gellary_service.dart';

class GellaryController {
  static RxList<String> gellary = <String>[].obs;
  static RxBool isloading = RxBool(false);

  static Future<dynamic> getGellary() async {
    isloading.value = true;
    gellary.value = await GellaryService.getGellary();
    log(' gellary.value${gellary.value}');
    isloading.value = false;
  }

  static Future<bool> uploadImage(imagePath) async {
    return await GellaryService.uploadImage(
      imagePath,
    );
  }
}
