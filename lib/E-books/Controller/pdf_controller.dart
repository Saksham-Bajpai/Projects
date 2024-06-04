import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:uuid/uuid.dart';


class PdfController extends GetxController {
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  final storage = FirebaseStorage.instance;

  void pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      File file = File(result.files.first.path!);
      var uuid = Uuid();
      var fileName = uuid.v1();
      var storageRef = storage.ref().child("PDFs/$fileName");
      var response = await storageRef.putFile(file);
      String downloadURL = await response.ref.getDownloadURL();
      print("Download URL: $downloadURL");
    }
  }
}
