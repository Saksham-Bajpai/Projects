import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function(GoogleSignInAccount)? onPressed;

  GoogleSignInButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        onPressed?.call(googleUser!);
      },
      icon: Icon(Icons.login),
      label: Text('Sign in with Google'),
    );
  }
}
