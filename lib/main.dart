import 'package:flutter/material.dart';
import 'package:to_do/add_task/add_task.dart';
import 'package:to_do/home/home_screen.dart';
import 'package:to_do/splash/splash_screen.dart';

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
      },
      initialRoute:splashScreen.routeName,

    );
  }
}
