import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/consts/lists.dart';
import 'package:charity_reads_1/buyer/views/auth_screen/google_sign_in.dart';
import 'package:charity_reads_1/buyer/controllers/auth_controller.dart';
import 'package:charity_reads_1/buyer/views/auth_screen/google_button.dart';
import 'package:charity_reads_1/buyer/views/auth_screen/signup_screen.dart';
import 'package:charity_reads_1/buyer/views/home_screen/home.dart';
import 'package:charity_reads_1/buyer/views/home_screen/home_screen.dart';
import 'package:charity_reads_1/buyer/widgets_common/applogo_widget.dart';
import 'package:charity_reads_1/buyer/widgets_common/bg_widget.dart';
import 'package:charity_reads_1/buyer/widgets_common/custom_textfield.dart';
import 'package:charity_reads_1/buyer/widgets_common/our_buttons.dart';
import 'package:flutter/material.dart';
import 'package:charity_reads_1/buyer/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(22).make(),
              15.heightBox,
              Obx(
                () => Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTextField(
                        hint: emailHint,
                        title: email,
                        isPass: false,
                        controller: controller.emailController),
                    customTextField(
                        hint: passwordHint,
                        title: password,
                        isPass: true,
                        controller: controller.passwordController),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: forgetPassword.text.make())),
                    5.heightBox,
                    // ourButton().box.width(context.screenWidth - 50).make(),
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : ourButton(
                            color: Colors.black,
                            title: login,
                            textColor: whiteColor,
                            onPress: () async {
                              controller.isloading(true);

                              await controller
                                  .loginMethod(context: context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context, msg: loggedIn);
                                  Get.offAll(() => const Home());
                                } else {
                                  controller.isloading(false);
                                }
                              });
                            },
                          ).box.width(context.screenWidth - 50).make(),

                    5.heightBox,
                    createNewAccount.text.color(fontGrey).make(),
                    5.heightBox,
                    ourButton(
                        color: Colors.grey.shade800,
                        title: signup,
                        textColor: whiteColor,
                        onPress: () {
                          Get.to(() => const SignupScreen());
                        }).box.width(context.screenWidth - 50).make(),

                    10.heightBox,
                    loginWith.text.color(fontGrey).make(),
                    5.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          1,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GoogleSignInButton(
                                  onPressed: handleGoogleSignIn,
                                ),
                              )),
                    ),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
