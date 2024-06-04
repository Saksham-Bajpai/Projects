import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/controllers/cart_controller.dart';
import 'package:charity_reads_1/buyer/views/cart_screen/payment_methods.dart';
import 'package:charity_reads_1/buyer/widgets_common/custom_textfield.dart';
import 'package:charity_reads_1/buyer/widgets_common/our_buttons.dart';
import 'package:get/get.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: "Shipping Info"
            .text
            .fontFamily(semibold)
            .color(whiteColor)
            .make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        //width: context.screenWidth - 80,
        child: ourButton(
            onPress: () {
              if (controller.addressController.text.length > 10 &&
                  controller.cityController.text.length > 3 &&
                  controller.stateController.text.length > 5 &&
                  controller.zipcodeController.text.length >= 6 &&
                  controller.phoneController.text.length >= 10
                  // controller.phoneController.text.length < 10
              ) {
                Get.to(() => const PaymentMethods());
              } else {
                VxToast.show(context, msg: "Please fill the fields Correctly");
              }
            },
            color: Colors.black,
            textColor: whiteColor,
            title: "Continue"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              customTextField(
                  hint: "Address",
                  isPass: false,
                  title: "Address",
                  controller: controller.addressController),
              customTextField(
                  hint: "City",
                  isPass: false,
                  title: "City",
                  controller: controller.cityController),
              customTextField(
                  hint: "State",
                  isPass: false,
                  title: "State",
                  controller: controller.stateController),
              customTextField(
                  hint: "Zip Code",
                  isPass: false,
                  title: "Zip Code",
                  controller: controller.zipcodeController),
              customTextField(
                  hint: "Phone Number",
                  isPass: false,
                  title: "Phone Number",
                  controller: controller.phoneController),
            ],
          ),
        ),
      ),
    );
  }
}
