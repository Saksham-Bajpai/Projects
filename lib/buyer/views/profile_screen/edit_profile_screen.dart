import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/controllers/profile_controller.dart';
import 'package:charity_reads_1/buyer/widgets_common/bg_widget.dart';
import 'package:charity_reads_1/buyer/widgets_common/custom_textfield.dart';
import 'package:charity_reads_1/buyer/widgets_common/our_buttons.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:charity_reads_1/buyer/controllers/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();


    return bgWidget(
        child: Scaffold(

      // appBar: AppBar(leading: const BackButton(
      //   color: Colors.white,
      // ),),
      body: Obx(
        () => SingleChildScrollView(

          child: Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              //if data image url and controller path is Empty
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                  ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()

                  //if data is not empty but controller path is Empty
                  : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                      ? Image.network(
                          data['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()

                      //if both are empty
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              5.heightBox,
              ourButton(
                  color: Colors.black,
                  onPress: () {
                    controller.changeImage(context);

                  },
                  textColor: whiteColor,
                  title: "Change"),
              const Divider(),
              20.heightBox,
              customTextField(
                  controller: controller.nameController,
                  hint: nameHint,
                  title: name,
                  isPass: false),
              10.heightBox,
              customTextField(
                  controller: controller.oldpassController,
                  hint: passwordHint,
                  title: oldpass,
                  isPass: true),
              10.heightBox,
              customTextField(
                  controller: controller.newpassController,
                  hint: passwordHint,
                  title: newpass,
                  isPass: true),
              20.heightBox,
              controller.isLoading.value
                  ?  const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.black),
                    )
                  : SizedBox(
                      width: context.screenWidth - 60,
                      child: ourButton(
                          color: Colors.black,
                          onPress: () async {
                            controller.isLoading(true);

                            //if image is not selected
                            if (controller.profileImgPath.value.isNotEmpty) {
                              await controller.uploadProfileImage();
                            } else {
                              controller.profileImageLink = data['imageUrl'];
                            }

                            //if old password matches data base
                            if (data['password'] ==
                                controller.oldpassController.text) {
                              await controller.changeAuthPassword(
                                  email: data['email'],
                                  password: controller.oldpassController.text,
                                  newpassword: controller.newpassController.text);

                              await controller.updateProfile(
                                  imgUrl: controller.profileImageLink,
                                  name: controller.nameController.text,
                                  password: controller.newpassController.text);
                              VxToast.show(context, msg: "Updated");
                            } else {
                              VxToast.show(context, msg: "Wrong old password");
                              controller.isLoading(false);
                            }
                          },
                          textColor: whiteColor,
                          title: "Save Changes"))
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make(),
        ),
      ),
    ));
  }
}
