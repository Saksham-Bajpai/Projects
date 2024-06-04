import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:flutter/material.dart';

Widget homeButtons({width,height,icon, String? title,onPress}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width: 26),
      8.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.rounded.white.size(width, height).make();
}