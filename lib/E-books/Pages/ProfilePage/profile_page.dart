
import 'package:charity_reads_1/E-books/Components/back_button.dart';
import 'package:charity_reads_1/E-books/Components/book_tile.dart';
import 'package:charity_reads_1/E-books/Components/primary_button.dart';
import 'package:charity_reads_1/E-books/Config/colors.dart';
import 'package:charity_reads_1/E-books/Controller/auth_controller.dart';
import 'package:charity_reads_1/E-books/Controller/book_controller.dart';
import 'package:charity_reads_1/E-books/Models/data.dart';
import 'package:charity_reads_1/E-books/Pages/AddNewBook/add_new_book.dart';
import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/controllers/auth_controller.dart';
import 'package:charity_reads_1/buyer/views/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Homepage/home_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    BookController bookController = Get.put(BookController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddNewBookPage());
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.background,
          //color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Colors.black,
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const MyBackButton(),
                          Text(
                            "Profile",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                              color:
                              Theme.of(context).colorScheme.background,
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                await Get.put(AuthController())
                                    .signOutMethod(context);
                                Get.offAll(() => const LoginScreen());
                              },
                              icon: Icon(
                                Icons.exit_to_app,
                                color: Theme.of(context).colorScheme.background,
                              ))
                        ],
                      ),
                      const SizedBox(height: 60),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.background,
                            )),
                        child: Container(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Icon(Icons.person,size: 80,color: Colors.white,),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        authController.getCurrentUserDisplayName() ?? 'Unknown User',
                         // "${authController.auth.currentUser!.displayName}",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                      Text(
                          authController.getCurrentUserEmail() ?? 'Unknown Email',
                        style:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .background,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Your Books",
                          style: Theme.of(context).textTheme.labelMedium
    ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Obx(
                        () => Column(
                      children: bookController.currentUserBooks
                          .map((e) => BookTile(
                        title: e.title!,
                        coverUrl: e.coverUrl!,
                        author: e.author!,
                        price: e.price!,
                        rating: e.rating!,
                        totalRating: 12,
                        ontap: () {},
                      ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
