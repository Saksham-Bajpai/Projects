import 'package:charity_reads_1/buyer/controllers/product_controller.dart';
import 'package:charity_reads_1/buyer/services/firestore_services.dart';
import 'package:charity_reads_1/buyer/views/category_screen/item_details.dart';
import 'package:charity_reads_1/buyer/widgets_common/bg_widget.dart';
import 'package:charity_reads_1/buyer/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charity_reads_1/buyer/controllers/product_controller.dart';
import '../../consts/consts.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No Products Found!".text.color(darkFontGrey).make(),
            );
          } else {

            var data = snapshot.data!.docs;

            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          controller.subcat.length,
                          (index) => "${controller.subcat[index]}"
                              .text
                              .size(12)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .white
                              .rounded
                              .size(120, 60)
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .white
                              .make()),
                    ),
                  ),
                  20.heightBox,
                  Expanded(
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 250,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8),
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(data[index]['p_images'][0],
                                    width: 200, height: 160,
                                    fit: BoxFit.cover),
                                "${data[index]['p_name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                3.heightBox,
                                "${data[index]['p_price']}"
                                    .numCurrency.text
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make()
                              ],
                            )
                                .box
                                .white
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 10))
                                .roundedSM
                                .outerShadowSm
                                .padding(const EdgeInsets.all(12))
                                .make()
                                .onTap(() {
                                  controller.checkIfFav(data[index]);
                              Get.to(() => ItemDetails(title: "${data[index]['p_name']}", data: data[index],));
                            });
                          }))
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
