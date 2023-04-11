import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:mygellary/core/cache.dart';
import '../core/dio_helper.dart';

class GellaryService {
  static RxString name = RxString('');

  static Future<String> getName() async {
    try {
      name.value = await Cache.getName();
      return name.value;
    } catch (e) {
      print(e.toString());
      name.value = '';
      return name.value;
    }
  }

  static Future<List<String>> getGellary() async {
    var url = 'https://technichal.prominaagency.com/api/my-gallery';
    String token = await Cache.getToken();

    var headers = {'Authorization': 'Bearer $token'};

    try {
      var response = await DioHelper.apiGet(url: url, headers: headers);
      List<dynamic> data = response.data['data']['images'];
      log("response $response");
      List<String> myGellary = data.map(
        (e) {
          return e.toString();
        },
      ).toList();

      log("myGellary $myGellary");
      return myGellary;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<bool> uploadImage(String imagePath) async {
    var url = 'https://technichal.prominaagency.com/api/upload';
    String token = await Cache.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final body = dio.FormData.fromMap({
      'img': await dio.MultipartFile.fromFile(
        imagePath,
        filename: imagePath.split('/').last,
      ),
    });

    try {
      var response =
          await DioHelper.apiPost(url: url, headers: headers, body: body);
      log("RES${response.data}");
      bool send = response.data['status'] == 'success';
      return send;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
