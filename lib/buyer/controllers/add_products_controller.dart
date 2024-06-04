import 'dart:io';

import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/models/category_models.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductsController extends GetxController {
  var pnameController = TextEditingController();
  var pdescController = TextEditingController();
  var ppriceController = TextEditingController();
  var pquantityController = TextEditingController();

  var categoryList =  <String>[].obs;
  var subcategoryList = <String>[].obs;
  List<Category> category = [];
  var pImagesList = RxList<dynamic>.generate(2, (index) => null);

  var categoryvalue = ''.obs;
  var subcategoryvalue = ''.obs;
  var selectedColorIndex = 0.obs;

  getCategories() async {
    var data = await rootBundle.loadString("lib/buyer/services/category_model.json");
    var cat = categoryModelFromJson(data);
    category = cat.categories;
  }

  populateCategoryList() {
    categoryList.clear();

    for (var item in category) {
      categoryList.add(item.name);
    }
  }
  populateSubCategory(cat) {
    subcategoryList.clear();

    var data = category.where((element) => element.name == cat).toList();

    for (var i = 0; i < data.first.subcategory.length;i++) {
      subcategoryList.add(data.first.subcategory[i]);
    }
  }

  pickImage(index,context) async {
    try {
      final img = await ImagePicker().pickImage(
          source: ImageSource.gallery, imageQuality: 100);
      if (img == null) {
        return;
      }else {
        pImagesList[index] = File(img.path);
      }
    } catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }

}