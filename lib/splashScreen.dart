import 'package:flutter/material.dart';
import 'dart:async';
import 'editProfileScreen.dart';
//import 'newsScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer T;
  int start = 2;

  void startTimer() {
    const oneSec = Duration(seconds: 2);
    T = Timer.periodic(oneSec, (Timer timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const EditProfile()));
        });
      } else {
        start--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ClipOval(
                child: Image.network(
                    'https://img.freepik.com/free-vector/cute-astronaut-reading-newspaper-toilet-cartoon-vector-icon-illustration-science-technology-icon_138676-4438.jpg?w=1060&t=st=1687662156~exp=1687662756~hmac=08eddc99eea7da16c77d8443e98ec0678e05f628bc7a06da53c10bc70092713b',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover))));
  }
}
