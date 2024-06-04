
import 'package:charity_reads_1/E-books/Controller/book_controller.dart';
import 'package:charity_reads_1/E-books/Controller/splace_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    BookController bookController = Get.put(BookController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset("assets/Assets/Animation/Anim1.json"),
      ),
    );
  }
}
