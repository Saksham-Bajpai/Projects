import 'package:charity_reads_1/buyer/consts/colors.dart';
import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/widgets_common/text_style.dart';

Widget productImages({required label, onPress}) {
  return "$label".text.bold.color(fontGrey).size(16.0).makeCentered()
      .box
      .color(lightGrey)
      .size(150, 200)
      .roundedSM
      .make();
}
