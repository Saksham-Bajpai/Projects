import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/consts/lists.dart';
import 'package:charity_reads_1/buyer/controllers/cart_controller.dart';
import 'package:charity_reads_1/buyer/views/home_screen/home_screen.dart';
import 'package:charity_reads_1/buyer/widgets_common/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets_common/our_buttons.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Obx(
      () => Scaffold(
        backgroundColor: whiteColor,
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 60,
                width: context.screenWidth - 60,
                child: controller.placingOrder.value ? Center(
                  child: loadingIndicator(),
                ) : ourButton(
                  color: Colors.black,
                  onPress: () async {
                    await controller.placeMyOrder(
                        orderPaymentMethod:
                            paymentMethods[controller.paymentIndex.value],
                        totalAmount: controller.totalP.value);

                    await controller.clearCart();
                    VxToast.show(context, msg: "Order placed seccessfullly");
                    Get.offAll(const HomeScreen());
                  },
                  textColor: whiteColor,
                  title: "Place my order",
                ),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: "Choose Your Method"
              .text
              .fontFamily(semibold)
              .color(darkFontGrey)
              .make(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(
              () => Column(
                children: List.generate(paymentMethodsImg.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      controller.changePaymentIndex(index);
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            //style: BorderStyle.solid,
                            color: controller.paymentIndex.value == index
                                ? blackColor
                                : Colors.transparent,
                            width: 4,
                          )),
                      margin: EdgeInsets.only(bottom: 8),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.asset(paymentMethodsImg[index],
                              width: double.infinity,
                              height: 120,
                              colorBlendMode:
                                  controller.paymentIndex.value == index
                                      ? BlendMode.darken
                                      : BlendMode.color,
                              color: controller.paymentIndex.value == index
                                  ? blackColor.withOpacity(0.5)
                                  : Colors.transparent,
                              fit: BoxFit.cover),
                          controller.paymentIndex.value == index
                              ? Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    activeColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                )
                              : Container(),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: paymentMethods[index]
                                .text
                                .white
                                .fontFamily(semibold)
                                .size(16)
                                .make(),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
