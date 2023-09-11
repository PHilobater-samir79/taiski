import 'package:get_it/get_it.dart';
import 'package:to_do/core/local_Data/catch_helper.dart';
import 'package:to_do/core/local_Data/sqflite_Database.dart';

final getIt = GetIt.instance;
 void setup()  {
   getIt.registerLazySingleton<CacheHelper>(() => CacheHelper() );
   getIt.registerLazySingleton<SQFLiteHelper>(() => SQFLiteHelper());

 }