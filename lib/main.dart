import 'package:flutter/material.dart';
import 'splashScreen.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.grey,
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
