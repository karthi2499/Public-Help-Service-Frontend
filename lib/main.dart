import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// IMPORTING SCREENS
import 'package:finalyearproject/Screens/exportScreens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyBYXD0gwlbTkhjjrhmshal0ec6QDsj-b2k",
  //     messagingSenderId: "299401924226",
  //     appId: "1:299401924226:web:27aea79f8f64d858b1ee9b",
  //     projectId: "phs-by-karthikeyan", // Your projectId
  //   ),
  //
  // );
  if(kIsWeb){

    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBYXD0gwlbTkhjjrhmshal0ec6QDsj-b2k",
        messagingSenderId: "299401924226",
        appId: "1:299401924226:web:27aea79f8f64d858b1ee9b",
        projectId: "phs-by-karthikeyan", // Your projectId
      ),
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Public Help Service',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen()
    );
  }
}