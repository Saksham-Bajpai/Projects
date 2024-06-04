import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// void _handleGoogleSignIn(GoogleSignInAccount? googleUser) async {
//   if (googleUser != null) {
//     // Use the GoogleSignInAccount object to authenticate with Firebase
//     // You can access the Google user's email and other details from googleUser
//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     // Sign in to Firebase with the Google credentials
//     await FirebaseAuth.instance.signInWithCredential(credential);
//   } else {
//     // Handle sign-in failure
//     print('Google sign-in failed');
//   }
// }

// Function to handle Google Sign-In
//


void handleGoogleSignIn(GoogleSignInAccount? googleUser) async {
  try {
    if (googleUser != null) {
      // Obtain the authentication tokens from the signed-in user
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a credential from the access token and ID token
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credentials
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Retrieve user details if needed
      final User? user = userCredential.user;

      // Perform any additional actions after successful sign-in
      print('Google sign-in successful. User ID: ${user?.uid}');

      // Navigate to the next screen or perform other actions as needed
      // Example: Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Handle sign-in failure
      print('Google sign-in failed');
    }
  } catch (error) {
    // Handle sign-in failure
    print('Error signing in with Google: $error');
    // Display an error message to the user or perform any necessary actions
  }
}
