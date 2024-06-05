import 'package:charity_reads_1/E-books/Components/primary_button.dart';
import 'package:charity_reads_1/E-books/Pages/Homepage/home_page.dart';
import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            padding: const EdgeInsets.all(20),
            color: Colors.black,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      "assets/Assets/Images/book.png",
                      width: 380,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "E - Book Store",
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Theme.of(context).colorScheme.background,
                              ),
                    ),
                    // const SizedBox(height: 10),
                    Flexible(

                      child: Text(
                        "Find the best E-Books for you to read and listen to",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            ),
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
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "Disclaimer",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        " Charity E-Books is your one-stop shop for endless reading adventures. Discover a treasure trove of free ebooks to suit every taste and interest. Take your entire library with you wherever you go, right on your mobile device.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall,


                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: PrimaryButton(
              btnName: "LOGIN TO E-BOOKS",
              ontap: () {
                // authController.loginWithEmail();
                Get.to(const HomePage());
              },
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
