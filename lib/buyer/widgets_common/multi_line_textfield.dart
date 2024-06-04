import 'package:flutter/material.dart';

// class multiLineTextField extends StatelessWidget {
//   final String hintText;
//   //final TextEditingController controller;
//   const multiLineTextField({
//     super.key,
//     required this.hintText,
//     //required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       maxLines: 5,
//       //controller: controller,
//       decoration: InputDecoration(
//         // fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
//         fillColor: Colors.grey[100],
//         filled: true,
//         hintText: hintText,
//       ),
//     );
//   }
// }


import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget multiLineTextField({String? title,String? hint,controller,isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        maxLines: 5,
        obscureText: isPass,
        //controller: controller,

        decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: redColor
                )
            )
        ),
      ),
      5.heightBox,
    ],
  );

}