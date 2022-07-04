// IMPORTING FIREBASE AUTH
import 'package:firebase_auth/firebase_auth.dart';

// IMPORTING FIREBASE CORE
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// IMPORTING GOOGLE SIGN IN
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();


String name = "";
String email = "";
String imageUrl = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyB2h2gH46XIaeDS65Ed3uP23mk4Vx6sMFs",
      appId: "1:299401924226:android:6a1691a10a405ae2b1ee9b",
      messagingSenderId: "299401924226",
      projectId: "phs-by-karthikeyan",
    ),
  );
}

Future<String?> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
  await _auth.signInWithCredential(credential);
  final User? user = authResult.user;

  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName!;
    email = user.email!;
    imageUrl = user.photoURL!;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User? currentUser = _auth.currentUser;
    assert(user.uid == currentUser!.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
}