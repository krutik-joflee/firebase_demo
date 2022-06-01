import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQcpS8JVuLBahNDRp730P5W9DiTotljBI',
    appId: '1:4853628222:android:62a23c82a3d32fadb0006f',
    messagingSenderId: '4853628222',
    projectId: 'firekrutik-512',
    storageBucket: 'firekrutik-512.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiCGO8-AVCiASgqSf8eOX2RtBV1c0Kju8',
    appId: '1:4853628222:ios:65d3efe86f5f36a7b0006f',
    messagingSenderId: '4853628222',
    projectId: 'firekrutik-512',
    storageBucket: 'firekrutik-512.appspot.com',
    iosClientId:
        '4853628222-grlbcgi326c9htmav7v7a7vlpg56o5m3.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseDemo',
  );
}
