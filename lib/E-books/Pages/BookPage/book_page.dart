//
// import 'package:charity_reads_1/E-books/Components/back_button.dart';
// import 'package:charity_reads_1/E-books/Controller/pdf_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class BookPage extends StatelessWidget {
//   final String bookUrl;
//   const BookPage({super.key, required this.bookUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     PdfController pdfController = Get.put(PdfController());
//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(
//           color: Theme.of(context).colorScheme.background,
//         ),
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         title: Text(
//           "Book title",
//           style: Theme.of(context)
//               .textTheme
//               .headlineMedium
//               ?.copyWith(color: Theme.of(context).colorScheme.background),
//         ),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           pdfController.pdfViewerKey.currentState?.openBookmarkView();
//         },
//         child: Icon(
//           Icons.bookmark,
//           color: Theme.of(context).colorScheme.background,
//         ),
//       ),
//       body: SfPdfViewer.network(
//         bookUrl,
//         key: pdfController.pdfViewerKey,
//       ),
//     );
//   }
// }


import 'package:charity_reads_1/E-books/Controller/pdf_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookPage extends StatelessWidget {
  final String bookUrl;
  const BookPage({Key? key, required this.bookUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PdfController pdfController = Get.put(PdfController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Use the default back button
        backgroundColor: Colors.black,
        title: Text(
          // Use the bookUrl as the title
          bookUrl,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Theme.of(context).colorScheme.background),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pdfController.pdfViewerKey.currentState?.openBookmarkView();
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.bookmark,
          color: Theme.of(context).colorScheme.background,
        ),),
      body: SfPdfViewer.network(
        bookUrl,
        key: pdfController.pdfViewerKey,
      ),);}}
