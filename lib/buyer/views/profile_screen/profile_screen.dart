import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/consts/lists.dart';
import 'package:charity_reads_1/buyer/controllers/auth_controller.dart';
import 'package:charity_reads_1/buyer/controllers/profile_controller.dart';
import 'package:charity_reads_1/buyer/controllers/product_controller.dart';
import 'package:charity_reads_1/buyer/views/auth_screen/login_screen.dart';
import 'package:charity_reads_1/buyer/views/products_screen/add_new_product.dart';
import 'package:charity_reads_1/buyer/views/chat_screen/messages_screen.dart';
import 'package:charity_reads_1/buyer/views/profile_screen/components/details_card.dart';
import 'package:charity_reads_1/buyer/views/profile_screen/edit_profile_screen.dart';
import 'package:charity_reads_1/buyer/widgets_common/bg_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charity_reads_1/buyer/services/firestore_services.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.black),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return SafeArea(
                  child: Column(
                children: [
                  //edit profile button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.edit, color: whiteColor))
                        .onTap(() {
                      controller.nameController.text = data['name'];
                      Get.to(() => EditProfileScreen(data: data));
                    }),
                  ),
                  //user details section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        data['imageUrl'] == ''
                            ? Image.asset(imgProfile2,
                                    width: 100, fit: BoxFit.cover)
                                .box
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make()
                            : Image.network(data['imageUrl'],
                                    width: 100, fit: BoxFit.cover)
                                .box
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make(),
                        10.widthBox,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['name']}"
                                .text
                                .fontFamily(semibold)
                                .white
                                .make(),
                            "${data['email']}".text.white.make(),
                          ],
                        )),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                            color: Colors.white,
                          )),
                          onPressed: () async {
                            await Get.put(AuthController())
                                .signOutMethod(context);
                            Get.offAll(() => const LoginScreen());
                          },
                          child: logout.text.fontFamily(semibold).white.make(),
                        ),
                      ],
                    ),
                  ),

                  // 20.heightBox,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     detailsCard(
                  //         count: data['cart_count'],
                  //         title: "your cart",
                  //         width: context.screenWidth / 3.5),
                  //     detailsCard(
                  //         count: data['wishlist_count'],
                  //         title: "your wishlist",
                  //         width: context.screenWidth / 3.5),
                  //     detailsCard(
                  //         count: data['order_count'],
                  //         title: "your orders",
                  //         width: context.screenWidth / 3.5),
                  //   ],
                  // ),
                  //
                  // //buttons section
                  // ListView.separated(
                  //   shrinkWrap: true,
                  //   separatorBuilder: (context, index) {
                  //     return const Divider(color: lightGrey);
                  //   },
                  //   itemCount: profileButtonsList.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return ListTile(
                  //       leading: Image.asset(
                  //         profileButtonsIconsList[index],
                  //         width: 23,
                  //       ),
                  //       title: profileButtonsList[index]
                  //           .text
                  //           .fontFamily(semibold)
                  //           .color(darkFontGrey)
                  //           .make(),
                  //
                  //     );
                  //   },
                  // )
                  //     .box
                  //     .white
                  //     .rounded
                  //     .margin(const EdgeInsets.all(12))
                  //     .padding(const EdgeInsets.symmetric(horizontal: 16))
                  //     .shadowSm
                  //     .make()
                  //     .box
                  //     .color(Colors.grey.shade300)
                  //     .make(),
                ],
              ));
            }
          },
        ),
      ),
    );
  }
}
