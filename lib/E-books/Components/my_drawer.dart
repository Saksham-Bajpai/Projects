// import 'package:charity_reads_1/E-books/Pages/WelcomePage/welcome_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// var myDrawer = Drawer(
//   child: Column(
//     children: [
//       ListTile(
//         title: Text("CALL"),
//         onTap: () {},
//       ),
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.black,
//       padding: const EdgeInsets.all(17),
//       shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     )
//   ),
//       onPressed: Get.to(const WelcomePage()),
//       child: Text("Exit",style:TextStyle(color: Colors.white,))
//
//   )
//     ],
//   ),
//

// import 'package:charity_reads_1/E-books/Pages/WelcomePage/welcome_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// var myDrawer = Drawer(
//   child: Column(
//     children: [
//       ListTile(
//         title: const Text("CALL"),
//         onTap: () {
//           // Handle call action
//         },
//       ),
//       ElevatedButton(
//
//         onPressed: () {
//           Get.offAll(const WelcomePage());
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.black,
//           padding: const EdgeInsets.all(17),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         child: const Text(
//           "Exit",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     ],
//   ),
// );
import 'package:charity_reads_1/E-books/Pages/WelcomePage/welcome_page.dart';
import 'package:charity_reads_1/buyer/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var myDrawer = Drawer(
  child: Stack(
    children: [
      Column(
        children: [
          ListTile(
            title: const Text("CALL"),
            onTap: () {
              // Handle call action
            },
          ),
        ],
      ),
      Positioned(
        bottom: 16, // Adjust bottom margin as needed
        right: 16, // Adjust right margin as needed
        child: ElevatedButton(
          onPressed: () {
            Get.offAll(() => const WelcomePage());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Exit",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  ),
);
