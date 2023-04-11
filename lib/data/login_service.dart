import 'dart:developer';

import 'package:mygellary/core/cache.dart';

import '../core/dio_helper.dart';

class LoginService {
  static Future<dynamic> login({String? email, String? password}) async {
    var url = 'https://technichal.prominaagency.com/api/auth/login';
    var body = {'email': email, 'password': password};
    try {
      var response = await DioHelper.apiPost(url: url, body: body);
      String token = response.data['token'];
      String name = response.data['user']['name'];
      await Cache.saveToken(token);
      await Cache.saveName(name);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
