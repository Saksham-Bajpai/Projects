// import 'package:charity_reads_1/buyer/consts/consts.dart';
// import 'package:charity_reads_1/buyer/models/category_models.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// class ProductController extends GetxController {
//
//   var quantity = 0.obs;
//   var colorIndex = 0.obs;
//   var totalPrice = 0.obs;
//
//   var addedToCart = false.obs;
//
//   var subcat = [];
//   getSubCategories (title) async {
//     subcat.clear();
//     var data = await rootBundle.loadString("lib/buyer/services/category_model.json");
//     var decoded = categoryModelFromJson(data);
//     var s = decoded.categories.where((element) => element.name == title).toList();
//
//     for (var e in s[0].subcategory) {
//       subcat.add(e);
//     }
//   }
//
//   changeColorIndex(index) {
//     colorIndex = index;
//   }
//
//   increaseQuantity(totalQuantity) {
//     if(quantity.value < totalQuantity)
//     quantity.value++;
//   }
//   decreaseQuantity() {
//     if(quantity.value > 0)
//     quantity.value--;
//   }
//
//   calculateTotalPrice(price) {
//     totalPrice.value = price * quantity.value;
//   }
//
//   addToCart({
//     title, img, sellername, color, qty, tprice, context
// }) async {
//     await firestore.collection(cartCollection).doc().set({
//       'title': title,
//       'img': img,
//       'sellername': sellername,
//       'color': color,
//       'qty': qty,
//       'tprice': tprice,
//       'added_by': currentUser!.uid
//     }).then((_) {
//       addedToCart.value = true; // Item added to cart, update state
//     }).catchError((error) {
//       VxToast.show(context, msg: error.toString());
//     });
//   }
//
//   resetValue() {
//     totalPrice.value = 0;
//     quantity.value = 0;
//     colorIndex.value = 0;
//
//     addedToCart.value = false;
//   }
//
// }




//test run
// Import necessary packages and files
import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/models/category_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// Define ProductController class
class ProductController extends GetxController {

  // Define observable variables
  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;
  var isInCart = false.obs;// Added observable variable to track cart status
  var isFav = false.obs;

  var subcat = [];


  // Method to get subcategories
  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/buyer/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  // Method to change color index
  changeColorIndex(index) {
    colorIndex.value = index;
  }

  // Method to increase quantity
  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) quantity.value++;
  }

  // Method to decrease quantity
  decreaseQuantity() {
    if (quantity.value > 0) quantity.value--;
  }

  // Method to calculate total price
  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  // Method to add item to cart
  addToCart({
    required String title,
    required String img,
    required String sellername,
    required String color,
    required String sellerID,
    required int qty,
    required int tprice,
    vendorId,
    required BuildContext context,
  }) async {
    if (quantity.value > 0) {
      await firestore.collection(cartCollection).doc().set({
        'title': title,
        'img': img,
        'sellername': sellername,
        'color': color,
        'qty': qty,
        'seller_id': sellerID,
        'tprice': tprice,
        'added_by': currentUser!.uid,
      }).then((_) {
        isInCart.value = true; // Update cart status when item is added
      }).catchError((error) {
        VxToast.show(context, msg: error.toString());
      });
    } else {
      VxToast.show(context, msg: "Please select at least one item.");
    }
  }

  // Method to reset values
  resetValue() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
    isInCart.value = false; // Reset cart status
  }

  addToWishlist(docId,context) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));

    isFav(true);
    VxToast.show(context, msg: "Added to Wishlist");
  }

  removeFromWishlist(docId,context) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));

    isFav(false);
    VxToast.show(context, msg: "Removed from Wishlist");
  }

  checkIfFav(data) async{
    if(data['p_wishlist'.contains(currentUser!.uid)]) {
      isFav(true);
    } else {
      isFav(false);
    }
  }

}
