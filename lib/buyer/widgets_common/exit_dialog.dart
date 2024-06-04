import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/widgets_common/our_buttons.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context) {
  return Dialog(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      ),
    child: Column (
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        const Divider(),
        10.heightBox,
        "Are you sure you want to exit ?".text.size(16).color(darkFontGrey).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
              color: Colors.black,
              onPress: () {
                SystemNavigator.pop();
              },
              textColor: whiteColor,
              title: "Yes"
            ),
            ourButton(
              color: Colors.black,
              onPress: () {
                Navigator.pop(context);
              },
              textColor: whiteColor,
              title: "No"
            ),
          ],
        ),
      ],
    ).box.color(lightGrey).padding(const EdgeInsets.all(12)).rounded.make(),
  );
}