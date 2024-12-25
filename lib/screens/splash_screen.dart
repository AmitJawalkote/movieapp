import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/screens/bottom_tabs.dart';
import 'package:movie_app/utils/helpers/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomTabScreen(),
            ));
      },
    );
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Lottie.asset('assets/animation1.json'),
      ),
    );
  }
}
