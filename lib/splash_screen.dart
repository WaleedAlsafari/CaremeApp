import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Careme/flutter_flow/flutter_flow_util.dart';
import 'package:Careme/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: AnimatedSplashScreen(
              splashIconSize: 175,
              backgroundColor: Color.fromARGB(255, 23, 102, 181),
              pageTransitionType: PageTransitionType.topToBottom,
              //curve: Curves.bounceInOut,
              splashTransition: SplashTransition.slideTransition,
              splash: Image.asset(
                'lib/icons/Careme-logos.jpeg',
                height: 200,
                width: 200,
              ),
              nextScreen: SignInWidget())),
    );
  }
}

// EasySplashScreen(
//           durationInSeconds: 2,
//           navigator:SignInWidget(),
//           loadingText: Text(
//             'Loading',
//             style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
//           ),
//           backgroundColor: Color.fromARGB(255, 23, 102, 181),
//           logoWidth: 275,
//           loaderColor: Colors.white,
//           logo: Image.asset(
//             'lib/icons/Careme-logos.jpeg',
//           ),
//         ),