import 'package:charity_reads_1/buyer/consts/consts.dart';

Widget normalText({text,color = whiteColor}) {
  return "$text".text.make();
}

Widget boldText({text,color = whiteColor, size = 16.0}) {
  return "$text".text.semiBold.color(color).size(size).make();
}
