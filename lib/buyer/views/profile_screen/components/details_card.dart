import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:flutter/material.dart';
Widget detailsCard({width,String? count,String? title}){
  return Column(
    children: [
      5.heightBox,
      count!.text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .rounded
      .width(width)
      .height(80)
      .padding(const EdgeInsets.all(4))
      .make();
}