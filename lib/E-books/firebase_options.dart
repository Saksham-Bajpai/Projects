
// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBDdd2IgxvOciMBGFrfWm1J2_EGkzdjQC4',
    appId: '1:128794479333:android:ff65383c0cfede2e05220c',
    messagingSenderId: '128794479333',
    projectId: 'charity-reads',
    authDomain: 'charity-reads.firebaseapp.com',
    storageBucket: 'charity-reads.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDdd2IgxvOciMBGFrfWm1J2_EGkzdjQC4',
    appId: '1:128794479333:android:ff65383c0cfede2e05220c',
    messagingSenderId: '128794479333',
    projectId: 'charity-reads',
    storageBucket: 'charity-reads.appspot.com',
      );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDdd2IgxvOciMBGFrfWm1J2_EGkzdjQC4',
    appId: '1:128794479333:android:ff65383c0cfede2e05220c',
    messagingSenderId: '128794479333',
    projectId: 'charity-reads',
    storageBucket: 'charity-reads.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDdd2IgxvOciMBGFrfWm1J2_EGkzdjQC4',
    appId: '1:128794479333:android:ff65383c0cfede2e05220c',
    messagingSenderId: '128794479333',
    projectId: 'charity-reads',
    storageBucket: 'charity-reads.appspot.com',
  );
}
