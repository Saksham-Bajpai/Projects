import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:charity_reads_1/buyer/consts/firebase_consts.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isloading = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  //text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  //login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
  //signup method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
  //storing data method
  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
      'cart_count': "00",
      'order_count': "00",
      'wishlist_count': "00",
    });
  }
  //signout method
  signOutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
// Method to get the current user
  User? get currentUser => auth.currentUser;

  // Method to get the current user's display name
  String? getCurrentUserDisplayName() {
    return auth.currentUser!.displayName;
  }
  // Method to get the current user's email
  String? getCurrentUserEmail() {
    return auth.currentUser?.email;
  }
  // Method to check if a user is signed in
  bool isUserSignedIn() {
    return auth.currentUser != null;
  }
}
