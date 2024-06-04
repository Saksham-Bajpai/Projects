import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButton({String? title}) {
  return Row(
    children: [
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .width(200)
      .height(50)
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(const EdgeInsets.all(4))
      .roundedSM
      .outerShadowSm
      .make();
}
