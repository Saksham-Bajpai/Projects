import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/controllers/cart_controller.dart';
import 'package:charity_reads_1/buyer/services/firestore_services.dart';
import 'package:charity_reads_1/buyer/views/cart_screen/shipping_screen.dart';
import 'package:charity_reads_1/buyer/widgets_common/loading_indicator.dart';
import 'package:charity_reads_1/buyer/widgets_common/our_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          automaticallyImplyLeading: false,
          title: "Book Cart".text.color(whiteColor).fontFamily(semibold).make(),
          backgroundColor: Colors.black,
        ),
        body: StreamBuilder(
            stream: FirestoreServices.getCart(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: "Cart is Empty".text.color(darkFontGrey).make(),
                );
              } else {
                var data = snapshot.data!.docs;
                controller.calculate(data);
                controller.productSnapshot = data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: Image.network(
                                    "${data[index]['img']}",
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                  title:
                                      "${data[index]['title']} (x${data[index]['qty']})"
                                          .text
                                          .fontFamily(semibold)
                                          .size(16)
                                          .make(),
                                  subtitle: "${data[index]['tprice']}"
                                      .numCurrency
                                      .text
                                      .fontFamily(semibold)
                                      .color(redColor)
                                      .size(14)
                                      .make(),
                                  trailing: Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  ).onTap(() {
                                    FirestoreServices.deleteDocument(
                                        data[index].id);
                                  }),
                                );
                              })),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Total price"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          Obx(() => "${controller.totalP.value}"
                              .numCurrency
                              .text
                              .fontFamily(semibold)
                              .color(redColor)
                              .make())
                        ],
                      )
                          .box
                          .padding(EdgeInsets.all(12))
                          .color(Colors.white12)
                          .width(context.screenWidth - 60)
                          .roundedSM
                          .make(),
                      10.heightBox,
                      SizedBox(
                        width: context.screenWidth - 60,
                        child: ourButton(
                          color: Colors.black,
                          onPress: () {
                            Get.to(() => const ShippingDetails());
                          },
                          textColor: whiteColor,
                          title: "Proceed to Shipping",
                        ),
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}

// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Expanded(child: Container(color: Colors.black12,)),
//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// "Total price".text.fontFamily(semibold).color(darkFontGrey).make(),
// "40".numCurrency.text.fontFamily(semibold).color(redColor).make()
// ],
// ).box.padding(EdgeInsets.all(12)).color(Colors.white12).width(context.screenWidth - 60).roundedSM.make(),
// 10.heightBox,
//
// SizedBox(
// width: context.screenWidth - 60,
// child: ourButton(
// color: Colors.black,
// onPress: () {},
// textColor: whiteColor,
// title: "Proceed to Shipping",
// ),),
// ],
// ),
// ),
