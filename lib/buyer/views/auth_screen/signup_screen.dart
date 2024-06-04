import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/views/home_screen/home.dart';
import 'package:charity_reads_1/buyer/widgets_common/bg_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charity_reads_1/buyer/controllers/auth_controller.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_buttons.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Join the $appname".text.fontFamily(bold).white.size(22).make(),
              15.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(
                        hint: nameHint,
                        title: name,
                        controller: nameController,
                        isPass: false),
                    customTextField(
                        hint: emailHint,
                        title: email,
                        controller: emailController,
                        isPass: false),
                    customTextField(
                        hint: passwordHint,
                        title: password,
                        controller: passwordController,
                        isPass: true),
                    customTextField(
                        hint: passwordHint,
                        title: retypePassword,
                        controller: passwordRetypeController,
                        isPass: true),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: forgetPassword.text.make())),
                    5.heightBox,
                    // ourButton().box.width(context.screenWidth - 50).make(),

                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          },
                        ),
                        10.heightBox,
                        Expanded(
                          child: RichText(
                              text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  )),
                              TextSpan(
                                  text: termsAndCond,
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: Colors.blue,
                                  )),
                              TextSpan(
                                  text: "&",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  )),
                              TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: Colors.blue,
                                  ))
                            ],
                          )),
                        ),
                      ],
                    ),
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : ourButton(
                            color: isCheck == true
                                ? Colors.black
                                : Colors.grey.shade800,
                            title: signup,
                            textColor: whiteColor,
                            onPress: () async {
                              if (isCheck != false) {
                                controller.isloading(true);
                                try {
                                  await controller
                                      .signupMethod(
                                          context: context,
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) {
                                    return controller.storeUserData(
                                        email: emailController.text,
                                        name: nameController.text,
                                        password: passwordController.text);
                                  }).then((value) {
                                    VxToast.show(context, msg: loggedIn);
                                    Get.offAll(() => const Home());
                                  });
                                } catch (e) {
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  controller.isloading(false);
                                }
                              }
                            }).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: alreadyHaveAccount,
                            style:
                                TextStyle(fontFamily: regular, color: fontGrey),
                          ),
                          TextSpan(
                            text: login,
                            style:
                                TextStyle(fontFamily: bold, color: Colors.blue),
                          ),
                        ],
                      ),
                    ).onTap(() {
                      Get.back();
                    }),
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
