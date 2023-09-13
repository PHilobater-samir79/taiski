import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/local_Data/catch_helper.dart';
import 'package:to_do/core/local_Data/sqflite_Database.dart';
import 'package:to_do/core/service/notifications.dart';
import 'package:to_do/core/service/services_locator.dart';
import 'package:to_do/features/splash/presention/screens/on_boarding.dart';
import 'package:to_do/features/splash/presention/screens/splash_screen.dart';
import 'package:to_do/features/tasks/presention/cubit/task_cubit.dart';
import 'package:to_do/features/tasks/presention/screens/add_task.dart';
import 'package:to_do/features/tasks/presention/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<CacheHelper>().cacheInit();
  getIt<SQFLiteHelper>().initDatabase();


  runApp(BlocProvider(
    create: (context) => TaskCubit()..getTasks(),
    child: taiski(),
  ));
}

class taiski extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.black),
          debugShowCheckedModeBanner: false,
          routes: {
            splashScreen.routeName: (context) => splashScreen(),
            homeScreen.routeName: (context) => homeScreen(),
            addTaskScreen.routeName: (context) => addTaskScreen(),
            onBoardingScreen.routeName: (context) => onBoardingScreen(),
          },
          initialRoute: splashScreen.routeName,
        );
      },
    );
  }
}
