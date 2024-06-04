import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/consts/lists.dart';
import 'package:charity_reads_1/buyer/controllers/add_products_controller.dart';
import 'package:charity_reads_1/buyer/controllers/product_controller.dart';
import 'package:charity_reads_1/buyer/services/store_services.dart';
import 'package:charity_reads_1/buyer/views/products_screen/add_new_product.dart';
import 'package:charity_reads_1/buyer/views/products_screen/product_details.dart';
import 'package:charity_reads_1/buyer/widgets_common/loading_indicator.dart';
import 'package:charity_reads_1/buyer/widgets_common/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddProductsController());

    return Scaffold(
      backgroundColor: whiteColor,
      //add products
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(
          onPressed: () async {
            await controller.getCategories();
            controller.populateCategoryList();
            Get.to(const AddProducts());
          },
          backgroundColor: Colors.black,
          child: Text(
            'Add',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: const Icon(Icons.arrow_back),
        //   color: whiteColor,
        // ),
        title: boldText(text: "Products", size: 18.0, color: whiteColor),
        backgroundColor: blackColor,
      ),
      body: StreamBuilder(
        stream: StoreServices.getProducts(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data.length,
                    (index) => Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => const ProductDetails());
                        },
                        leading: Image.network(
                          "${data[index]['p_images'][0]}",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: boldText(
                            text: "${data[index]['p_name']}", color: fontGrey),
                        subtitle: Row(
                          children: [
                            normalText(
                                text: "${data[index]['p_price']}",
                                color: darkFontGrey),
                            10.widthBox,
                            boldText(text: data[index]['is_featured'] == true ? "Featured" : '', color: Colors.green)
                          ],
                        ),
                        trailing: VxPopupMenu(
                          arrowSize: 0.0,
                          menuBuilder: () => Column(
                            children: List.generate(
                                popupMenuTitles.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Icon(popupMenuIcons[index]),
                                          10.widthBox,
                                          normalText(
                                              text: popupMenuTitles[index],
                                              color: darkFontGrey)
                                        ],
                                      ).onTap(() {
                                        VxPopupMenuController().hideMenu();
                                      }),
                                    ),
                            ),
                          ).box.white.rounded.width(200).make(),
                          clickType: VxClickType.singleClick,
                          child: const Icon(Icons.more_vert_rounded),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
