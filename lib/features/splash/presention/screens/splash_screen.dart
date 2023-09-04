import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/core/local_Data/catch_helper.dart';
import 'package:to_do/core/service/services_locator.dart';
import 'package:to_do/features/splash/presention/screens/on_boarding.dart';
import 'package:to_do/features/tasks/presention/screens/home_screen.dart';

class splashScreen extends StatefulWidget {
  static const String routeName = 'splashScreen';

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    navigator();
  }

  void navigator() {
    bool isVisited =
        getIt<CacheHelper>().getData(key: 'isVisited') ?? false;
    Future.delayed(Duration(seconds: 2), () {
      isVisited
          ? Navigator.pushReplacementNamed(context, homeScreen.routeName)
          : Navigator.pushReplacementNamed(context, onBoardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash.png',
                height: 130,
                width: 130,
              ),
              Text('taiski',
                  style: GoogleFonts.adamina(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold)))
            ],
          ),
        ),
      ),
    );
  }
}
