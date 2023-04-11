import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mygellary/controller/login_controller.dart';
import 'package:mygellary/view/login_screen/widget/login_text.dart';
import 'package:mygellary/view/login_screen/widget/my_gellary_text.dart';
import '../../core/constant.dart';
import '../my_gellary/my_gellary.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/LoginScreen';
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  loginSubmit(BuildContext context) async {
    await LoginController.login(
        email: emailController.text, password: passwordController.text);
    if (LoginController.isLogin.value) {
      Navigator.pushNamed(context, MyGellary.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Wrong Username or Password')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Image.asset(
              'assets/images/login_back.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: setWidth(context) * .075,
              ),
              child: SafeArea(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: setHeight(context) * .03,
                        ),
                        const MyGellaryText(),
                        SizedBox(
                          height: setHeight(context) * .03,
                        ),
                        Container(
                          height: setHeight(context) * .5,
                          width: isTablet(context)
                              ? setWidth(context) * .67
                              : setWidth(context) * .85,
                          padding: EdgeInsets.symmetric(
                            horizontal: setWidth(context) * .044,
                            vertical: setHeight(context) * .02,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(22)),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const LogInText(),
                                // ****** Username ******
                                TextField(
                                    controller: emailController,
                                    decoration: AppConst.inputDecoration(
                                        labelText: 'Username')),
                                // ****** Password ******
                                TextField(
                                    controller: passwordController,
                                    decoration: AppConst.inputDecoration(
                                        labelText: 'Password')),

                                // ****** Submit Button ******
                                Obx(() {
                                  if (LoginController.isloading.value) {
                                    return const CircularProgressIndicator(
                                        color: Colors.blue,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.blue));
                                  }
                                  return MaterialButton(
                                    minWidth: setWidth(context) * .72,
                                    height: setHeight(context) * .055,
                                    onPressed: () => loginSubmit(context),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontSize: isTablet(context)
                                              ? setFontSize(context) * .09
                                              : setFontSize(context) * .13),
                                    ),
                                  );
                                })
                              ]),
                        )
                      ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
