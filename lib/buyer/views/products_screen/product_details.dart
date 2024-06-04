import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/controllers/product_controller.dart';
import 'package:charity_reads_1/buyer/widgets_common/text_style.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const ProductDetails({Key? key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: whiteColor,
        ),
        title:
            boldText(text: "${data['p_name']}", size: 16.0, color: whiteColor),
        backgroundColor: blackColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                autoPlay: true,
                height: 350,
                aspectRatio: 4 / 5,
                viewportFraction: 1.0,
                itemCount: data['p_images'].length,
                itemBuilder: (context, index) {
                  return Image.network(
                    data['p_images'][index],
                    //width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(
                      text: "${data['p_name']}", color: fontGrey, size: 16.0),
                  10.heightBox,
                  Row(
                    children: [
                      boldText(
                          text: "${data['p_category']}",
                          color: fontGrey,
                          size: 16.0),
                      10.heightBox,
                      boldText(
                          text: "${data['P_subcategory']}",
                          color: fontGrey,
                          size: 16.0),
                    ],
                  ),
                  10.heightBox,
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
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: "Color", color: fontGrey),
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor)
                                  .margin(EdgeInsets.symmetric(horizontal: 4))
                                  .make()
                                  .onTap(() {}),
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: "Quantity", color: fontGrey),
                          ),
                          normalText(
                              text: "${data['p_quantity']}", color: fontGrey),
                        ],
                      )
                    ],
                  ).box.white.padding(EdgeInsets.all(8)).make(),
                  const Divider(),
                  20.heightBox,
                  boldText(text: "Description", color: fontGrey),
                  10.heightBox,
                  normalText(text: "${data['p_desc']}", color: fontGrey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
