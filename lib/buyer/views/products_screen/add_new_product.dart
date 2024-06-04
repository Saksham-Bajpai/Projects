import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/controllers/add_products_controller.dart';
import 'package:charity_reads_1/buyer/controllers/product_controller.dart';
import 'package:charity_reads_1/buyer/views/products_screen/product_dropdown.dart';
import 'package:charity_reads_1/buyer/views/products_screen/product_images.dart';
import 'package:charity_reads_1/buyer/widgets_common/custom_textfield.dart';
import 'package:charity_reads_1/buyer/widgets_common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../E-books/Components/multiline_text_formfield.dart';
import '../../widgets_common/multi_line_textfield.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AddProductsController>();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: whiteColor,
        ),
        title: boldText(text: "Add Product", size: 18.0, color: whiteColor),
        actions: [
          TextButton(
              onPressed: () {}, child: boldText(text: save, color: whiteColor))
        ],
        backgroundColor: blackColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              // color: Theme.of(context).colorScheme.primary,
              color: Colors.black,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      2,
                      (index) => controller.pImagesList[index] != null
                          ? Image.file(controller.pImagesList[index],width: 100,).onTap(() {controller.pickImage(index, context);})
                          : productImages(label: "${index + 1}").onTap(() {
                              controller.pickImage(index, context);
                            })),
                ),
              ),
            ),
            20.heightBox,
            customTextField(
                    hint: "A Brief History Of Time",
                    title: "Product name",
                    isPass: false,
                    controller: controller.pnameController)
                .box
                .width(context.screenWidth - 30)
                .make(),
            10.heightBox,
            multiLineTextField(
                    hint: "Book Description",
                    title: "Description",
                    isPass: false,
                    controller: controller.pdescController)
                .box
                .width(context.screenWidth - 30)
                .make(),
            10.heightBox,
            customTextField(
                    hint: "\$100",
                    title: "Price",
                    isPass: false,
                    controller: controller.ppriceController)
                .box
                .width(context.screenWidth - 30)
                .make(),
            10.heightBox,
            customTextField(
                    hint: "20",
                    title: "Quantity",
                    isPass: false,
                    controller: controller.pquantityController)
                .box
                .width(context.screenWidth - 30)
                .make(),
            10.heightBox,
            productDropdown("Category", controller.categoryList,
                controller.categoryvalue, controller),
            10.heightBox,
            productDropdown("Subcategory", controller.subcategoryList,
                controller.subcategoryvalue, controller),
            10.heightBox,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     // List.generate(3, (index) => productImages(),
            //     // ),
            //   ],
            // )
          ],
        ),
      ),
      // .box
      // .white
      // .rounded
      // .padding(const EdgeInsets.all(16))
      // .width(context.screenWidth - 30)
      // .shadowSm
      // .make(),
    );
  }
}
