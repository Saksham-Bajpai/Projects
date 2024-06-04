import 'package:charity_reads_1/E-books/Pages/HomePage/home_page.dart';
import 'package:charity_reads_1/E-books/Pages/SplacePage/splace_page.dart';
import 'package:charity_reads_1/E-books/Pages/WelcomePage/welcome_page.dart';
import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/controllers/home_controller.dart';
import 'package:charity_reads_1/buyer/views/cart_screen/cart_screen.dart';
import 'package:charity_reads_1/buyer/views/category_screen/category_screens.dart';
import 'package:charity_reads_1/buyer/views/home_screen/home_screen.dart';
import 'package:charity_reads_1/buyer/views/products_screen/product_screen.dart';
import 'package:charity_reads_1/buyer/views/profile_screen/profile_screen.dart';
import 'package:charity_reads_1/buyer/widgets_common/exit_dialog.dart';
import 'package:charity_reads_1/ebooks/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    var navBarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26),label: home,backgroundColor: Colors.black),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26),label: categories),
      BottomNavigationBarItem(icon: Icon(Icons.book),label: ebooks),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26),label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26),label: account)
    ];

    var navBody = [
      //const ProductsScreen(),
      const HomeScreen(),
      const CategoryScreen(),
      //const SplacePage(),
      const WelcomePage(),
      //const MainTabView(),
      const CartScreen(),
      const ProfileScreen(),

    ];

    return WillPopScope(

      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context, builder: (context) => exitDialog(context));
        return false;
        },
      child: Scaffold(
        body: Column(
          children: [
            Obx(()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
          ],
        ),
        bottomNavigationBar: Obx(() =>
            BottomNavigationBar(
              currentIndex: controller.currentNavIndex.value,
              selectedLabelStyle: const TextStyle(fontFamily: semibold),
              type: BottomNavigationBarType.fixed,
              backgroundColor: whiteColor,
              items: navBarItem,
              onTap: (value) {
                controller.currentNavIndex.value = value;
              },
            ),
        ),
      ),
    );
  }
}