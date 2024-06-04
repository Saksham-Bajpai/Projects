import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: BoxDecoration(

      image: DecorationImage(image: AssetImage(imgBackground2),fit: BoxFit.fill
      ),
    ),
    child: child,
  );
}