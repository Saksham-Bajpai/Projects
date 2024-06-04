import 'package:charity_reads_1/E-books/Config/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String btnName;
  final VoidCallback ontap;
  const PrimaryButton({super.key, required this.btnName, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 55,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: backgroundColour,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assets/Assets/Icons/google.png"),
            ),
            const SizedBox(width: 10),
            Text(
              btnName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.background,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}