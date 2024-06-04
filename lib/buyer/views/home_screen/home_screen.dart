import 'package:charity_reads_1/buyer/consts/lists.dart';
import 'package:charity_reads_1/buyer/controllers/add_products_controller.dart';
import 'package:charity_reads_1/buyer/controllers/product_controller.dart';
import 'package:charity_reads_1/buyer/services/firestore_services.dart';
import 'package:charity_reads_1/buyer/views/category_screen/item_details.dart';
import 'package:charity_reads_1/buyer/views/home_screen/components/featured_button.dart';
import 'package:charity_reads_1/buyer/views/products_screen/add_new_product.dart';
import 'package:charity_reads_1/buyer/widgets_common/home_buttons.dart';
import 'package:charity_reads_1/buyer/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey.shade300,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                  decoration: const InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: whiteColor,
                hintText: searchAnything,
                hintStyle: TextStyle(color: textfieldGrey),
              )),
            ),
            12.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: sliderList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            sliderList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                    //
                    // 10.heightBox,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: List.generate(
                    //       2,
                    //           (index) => homeButtons(
                    //         height: context.screenHeight * 0.15,
                    //         width: context.screenWidth / 2.5,
                    //         icon: index == 0 ? icTodaysDeal : icFlashDeal,
                    //         title: index == 0 ? todayDeal : flashSale,
                    //       )),
                    // ),
                    //second swiper
                    //10.heightBox,
                    // VxSwiper.builder(
                    //     aspectRatio: 16 / 9,
                    //     autoPlay: true,
                    //     height: 150,
                    //     enlargeCenterPage: true,
                    //     itemCount: secondSliderList.length,
                    //     itemBuilder: (context, index) {
                    //       return Image.asset(
                    //         secondSliderList[index],
                    //         fit: BoxFit.fill,
                    //       )
                    //           .box
                    //           .rounded
                    //           .clip(Clip.antiAlias)
                    //           .margin(const EdgeInsets.symmetric(horizontal: 8))
                    //           .make();
                    //     }),

                    //10.heightBox,
                    //buttons
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: List.generate(
                    //       3,
                    //           (index) => homeButtons(
                    //         height: context.screenHeight * 0.1,
                    //         width: context.screenWidth / 3.5,
                    //         icon: index == 0
                    //             ? icTopCategories
                    //             : index == 1
                    //             ? icBrands
                    //             : icTopSeller,
                    //         title: index == 0
                    //             ? topCategories
                    //             : index == 1
                    //             ? brand
                    //             : topSeller,
                    //       )),
                    // ),
                    // //featured categories
                    // 5.heightBox,
                    // Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: featuredCategories.text
                    //         .color(darkFontGrey)
                    //         .size(15)
                    //         .fontFamily(semibold)
                    //         .make()),
                    // 15.heightBox,
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: List.generate(
                    //       3,
                    //           (index) => Column(
                    //         children: [
                    //           featuredButton(title: featuredTitle1[index]),
                    //           10.heightBox,
                    //           featuredButton(title: featuredTitle2[index]),
                    //         ],
                    //       ),
                    //     ).toList(),
                    //   ),
                    // ),
                    // 20.heightBox,
                    // Container(
                    //   padding: const EdgeInsets.all(12),
                    //   width: double.infinity,
                    //   decoration: const BoxDecoration(
                    //     color: Colors.black,
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       featuredProduct.text.white
                    //           .fontFamily(bold)
                    //           .size(18)
                    //           .make(),
                    //       10.heightBox,
                    //       SingleChildScrollView(
                    //         scrollDirection: Axis.horizontal,
                    //         child: Row(
                    //           children: List.generate(
                    //               6,
                    //                   (index) => Column(
                    //                 crossAxisAlignment:
                    //                 CrossAxisAlignment.start,
                    //                 children: [
                    //                   Image.asset(imgP1,
                    //                       width: 150, fit: BoxFit.cover),
                    //                   // Image.asset(imgP2,
                    //                   //   width: 150, fit: BoxFit.cover),
                    //                   //Image.asset(imgP3,
                    //                   //  width: 150, fit: BoxFit.cover),
                    //                   //Image.asset(imgP4,
                    //                   //  width: 150, fit: BoxFit.cover),
                    //                   10.heightBox,
                    //                   "Reference Books"
                    //                       .text
                    //                       .fontFamily(semibold)
                    //                       .color(darkFontGrey)
                    //                       .make(),
                    //                   10.heightBox,
                    //                   "\$0"
                    //                       .text
                    //                       .color(redColor)
                    //                       .fontFamily(bold)
                    //                       .size(16)
                    //                       .make()
                    //                 ],
                    //               )
                    //                   .box
                    //                   .white
                    //                   .margin(const EdgeInsets.symmetric(
                    //                   horizontal: 4))
                    //                   .roundedSM
                    //                   .padding(const EdgeInsets.all(8))
                    //                   .make()),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    //All Products Section
                    30.heightBox,
                    StreamBuilder(
                      stream: FirestoreServices.allProducts(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return loadingIndicator();
                        } else {
                          var allproductsdata = snapshot.data!.docs;
                          return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: allproductsdata.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      mainAxisExtent: 300),
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                        allproductsdata[index]['p_images'][0],
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover),
                                    const Spacer(),
                                    "${allproductsdata[index]['p_name']}"
                                        .text
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                    10.heightBox,
                                    "${allproductsdata[index]['p_price']}"
                                        .numCurrency
                                        .text
                                        .color(redColor)
                                        .fontFamily(bold)
                                        .size(16)
                                        .make()
                                  ],
                                )
                                    .box
                                    .white
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .roundedSM
                                    .padding(const EdgeInsets.all(12))
                                    .make()
                                    .onTap(() {
                                  Get.to(() => ItemDetails(
                                        title:
                                            "${allproductsdata[index]['p_name']}",
                                        data: allproductsdata[index],
                                      ));
                                });
                              });
                        }
                      },
                    ),
                    //3rd Swiper
                    30.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondSliderList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            secondSliderList[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
