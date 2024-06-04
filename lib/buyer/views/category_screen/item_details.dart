import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/consts/lists.dart';
import 'package:charity_reads_1/buyer/controllers/product_controller.dart';
import 'package:charity_reads_1/buyer/views/cart_screen/cart_screen.dart';
import 'package:charity_reads_1/buyer/views/chat_screen/chat_screen.dart';
import 'package:charity_reads_1/buyer/widgets_common/our_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const ItemDetails({Key? key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool addedToCart = false;
    var controller = Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async {
        controller.resetValue();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.resetValue();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const CartScreen());
                },
                icon: const Icon(Icons.shopping_cart)),
            Obx(
              () => IconButton(
                  onPressed: () {
                    if (controller.isFav.value) {
                      controller.removeFromWishlist(data.id, context);
                      //controller.isFav(false);
                    } else {
                      controller.addToWishlist(data.id, context);
                      //controller.isFav(true);
                    }
                  },
                  icon: Icon(
                    Icons.favorite_outlined,
                    color: controller.isFav.value ? redColor : darkFontGrey,
                  )),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //swiper section
                      VxSwiper.builder(
                          autoPlay: true,
                          height: 350,
                          itemCount: data['p_images'].length,
                          aspectRatio: 4 / 5,
                          viewportFraction: 1.0,
                          itemBuilder: (context, index) {
                            return Image.network(
                              data['p_images'][index],
                              //width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          }),
                      10.heightBox,
                      // title and details section
                      title!.text
                          .size(16)
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      //rating
                      VxRating(
                        isSelectable: false,
                        value: double.parse(data['p_rating']),
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        maxRating: 5,
                        size: 25,
                        // stepInt: true
                      ),

                      10.heightBox,
                      "${data['p_price']}"
                          .numCurrency
                          .text
                          .color(redColor)
                          .fontFamily(bold)
                          .size(18)
                          .make(),

                      10.heightBox,

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Seller"
                                    .text
                                    .white
                                    .fontFamily(semibold)
                                    .size(16)
                                    .make(),
                                5.heightBox,
                                "${data['p_seller']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .size(18)
                                    .make(),
                              ],
                            ),
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.message_rounded,
                                color: darkFontGrey),
                          ).onTap(() {
                            Get.to(
                              () => const ChatScreen(),
                              arguments: [data['p_seller'], data['seller_id']],
                            );
                          }),
                        ],
                      )
                          .box
                          .height(60)
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .color(textfieldGrey)
                          .make(),

                      //color section
                      20.heightBox,
                      Obx(
                        () => Column(
                          children: [
                            // Row(
                            //   children: [
                            //     SizedBox(
                            //       width: 100,
                            //       child: "Color: ".text.color(textfieldGrey).make(),
                            //     ),
                            //     Row(
                            //       children: List.generate(
                            //           data['p_colors'].length,
                            //               (index) => Stack(
                            //                 alignment: Alignment.center,
                            //                 children: [
                            //                   VxBox()
                            //                   .size(40, 40)
                            //                   .roundedFull
                            //                   .color(Color(data['p_colors'][index]).withOpacity(1.0))
                            //                   .margin(EdgeInsets.symmetric(horizontal: 4))
                            //                   .make().onTap(() {
                            //                     controller.changeColorIndex(index);
                            //                   }),
                            //
                            //                   Visibility(
                            //                       visible: index == controller.colorIndex.value,
                            //                       child: const Icon(Icons.done,color: whiteColor,))
                            //                 ],
                            //               )),
                            //     ),
                            //   ],
                            // ).box.padding(EdgeInsets.all(8)).make(),

                            //quantity section
                            Obx(
                              () => Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: "Quantity: "
                                        .text
                                        .color(Colors.grey)
                                        .make(),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            controller.decreaseQuantity();
                                            controller.calculateTotalPrice(
                                                int.parse(data['p_price']));
                                          },
                                          icon: const Icon(Icons.remove)),
                                      controller.quantity.value.text
                                          .size(16)
                                          .color(Colors.grey)
                                          .fontFamily(bold)
                                          .make(),
                                      IconButton(
                                          onPressed: () {
                                            controller.increaseQuantity(
                                                int.parse(data['p_quantity']));
                                            controller.calculateTotalPrice(
                                                int.parse(data['p_price']));
                                          },
                                          icon: const Icon(Icons.add)),
                                      10.widthBox,
                                      "(${data['p_quantity']} available)"
                                          .text
                                          .color(textfieldGrey)
                                          .make(),
                                    ],
                                  ),
                                ],
                              ).box.padding(const EdgeInsets.all(8)).make(),
                            ),

                            //total row
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child:
                                      "Total: ".text.color(Colors.grey).make(),
                                ),
                                "${controller.totalPrice.value}"
                                    .numCurrency
                                    .text
                                    .color(redColor)
                                    .size(16)
                                    .fontFamily(bold)
                                    .make(),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),
                          ],
                        ).box.white.shadowSm.make(),
                      ),

                      //description
                      10.heightBox,
                      "Description"
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      "${data['p_description']}"
                          .text
                          .color(Colors.grey)
                          .fontFamily(semibold)
                          .make(),

                      //buttons section
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                          itemDetailsButtonsList.length,
                          (index) => ListTile(
                            title: itemDetailsButtonsList[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                      20.heightBox,

                      // //products you may also like
                      // productsYouMayLike.text
                      //     .fontFamily(bold)
                      //     .size(16)
                      //     .color(darkFontGrey)
                      //     .make(),
                      // 10.heightBox,

                      // copied widget from homeScreen featured products
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: List.generate(
                      //         6,
                      //         (index) => Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Image.asset(imgP2,
                      //                     width: 150, fit: BoxFit.cover),
                      //                 10.heightBox,
                      //                 "Reference Books"
                      //                     .text
                      //                     .fontFamily(semibold)
                      //                     .color(darkFontGrey)
                      //                     .make(),
                      //                 10.heightBox,
                      //                 "\$0"
                      //                     .text
                      //                     .color(redColor)
                      //                     .fontFamily(bold)
                      //                     .size(16)
                      //                     .make()
                      //               ],
                      //             )
                      //                 .box
                      //                 .white
                      //                 .margin(const EdgeInsets.symmetric(
                      //                     horizontal: 4))
                      //                 .roundedSM
                      //                 .padding(const EdgeInsets.all(8))
                      //                 .make()),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )),

              // SizedBox(
              //   // width: double.infinity,
              //   height: 60,
              //   width: context.screenWidth - 60,
              //   child: ourButton(
              //       color: Colors.black,
              //       onPress: () {
              //         controller.addToCart(
              //           color: data['p_colors'][controller.colorIndex.value],
              //           context: context,
              //           img: data['p_images'][0],
              //           qty: controller.quantity.value,
              //           sellername: data['p_seller'],
              //           title: data['p_name'],
              //           tprice: controller.totalPrice.value
              //         );
              //       },
              //       textColor: whiteColor,
              //       title: "Add to Cart"),
              // ),

              //if items are selected then add to cart
              SizedBox(
                height: 60,
                width: context.screenWidth - 60,
                child: Obx(() {
                  return ourButton(
                    // Change button color and title based on cart status
                    color: controller.isInCart.value
                        ? Colors.grey[800]
                        : Colors.black,
                    onPress: () {
                      if (controller.isInCart.value) {
                        // Navigate to cart screen if item is already in cart
                        Get.to(CartScreen());
                      } else {
                        // Add item to cart if not already in cart
                        controller.addToCart(
                          color: data['p_colors'][controller.colorIndex.value],
                          context: context,
                          sellerID: data['seller_id'],
                          img: data['p_images'][0],
                          qty: controller.quantity.value,
                          sellername: data['p_seller'],
                          title: data['p_name'],
                          tprice: controller.totalPrice.value,
                        );
                      }
                    },
                    textColor: whiteColor,
                    // Change button title based on cart status
                    title: controller.isInCart.value
                        ? "Go to Cart"
                        : "Add to Cart",
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
