import 'package:flutter/material.dart';
import 'package:to_do/features/splash/presention/screens/on_boarding.dart';
import 'package:to_do/features/splash/presention/screens/splash_screen.dart';
import 'package:to_do/features/tasks/presention/screens/add_task.dart';
import 'package:to_do/features/tasks/presention/screens/home_screen.dart';

void main() {
  runApp(taiski());
}

class taiski extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        splashScreen.routeName : (context) => splashScreen(),
        homeScreen.routeName : (context) => homeScreen(),
        addTaskScreen.routeName : (context) => addTaskScreen(),
        onBoardingScreen.routeName : (context ) => onBoardingScreen(),

      },
      initialRoute:onBoardingScreen.routeName,

    );
  }
}

