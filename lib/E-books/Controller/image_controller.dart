import 'dart:html';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageController extends GetxController {
  ImagePicker imagePicker = ImagePicker();

  void pickImage() async {
    final XFile? image =
    await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var uuid = const Uuid();
      var fileName = uuid.v1();
      var response = FirebaseStorage.instance.ref().child("Image/$fileName");
      print(response.storage.ref().getDownloadURL());
    }
  }
}

// class ImageController extends GetxController {
//   ImagePicker imagePicker = ImagePicker();
//   final storage = FirebaseStorage.instance;
//
//   void pickImage() async {
//     final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       var uuid = Uuid();
//       var fileName = uuid.v1();
//       var storageRef = storage.ref().child("Images/$fileName");
//       var response = await storageRef.putFile(File(image.path));
//       String downloadURL = await response.ref.getDownloadURL();
//       print("Download URL: $downloadURL");
//     }
//   }
// }


// class ImageController extends GetxController {
//   ImagePicker imagePicker = ImagePicker();
//   final storage = FirebaseStorage.instance;
//
//   void pickImage() async {
//     final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       var uuid = Uuid();
//       var fileName = uuid.v1();
//       var storageRef = storage.ref().child("Images/$fileName");
//       var file = File.fromUri(Uri.file(image.path)); // Create a File object from the image path
//       var response = await storageRef.putFile(file);
//       String downloadURL = await response.ref.getDownloadURL();
//       print("Download URL: $downloadURL");
//     }
//   }
// }
