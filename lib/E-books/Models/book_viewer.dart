import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  final String pdfDownloadUrl;

  const PdfViewerPage({Key? key, required this.pdfDownloadUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/charity-reads.appspot.com/o/Pdf%2FResearch%20Paper.pdf?alt=media&token=0a6e0aca-f7d9-4113-8ce6-6fd08a2b00fa',

      ),
    );
  }
}
