import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton({onPress,color,textColor,String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
       backgroundColor: color,
      padding: const EdgeInsets.all(17),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )
    ),
    onPressed: onPress,
    child: title!.text.color(textColor).fontFamily(bold).make(),

  );
}