import 'package:get/get.dart';
import '../data/login_service.dart';

class LoginController {
  static RxBool isLogin = false.obs;
  static RxBool isloading = false.obs;

  static Future<dynamic> login({String? email, String? password}) async {
    isloading.value = true;
    isLogin.value = await LoginService.login(
      email: email,
      password: password,
    );
    isloading.value = false;
  }
}
