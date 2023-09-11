import 'package:sqflite/sqflite.dart';
import 'package:to_do/features/tasks/data/TaskModel.dart';

class SQFLiteHelper {
  late Database database;
  void initDatabase() async {
    await openDatabase(
      'tasks.database',
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute('''
          CREATE TABLE Tasks (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          endTime TEXT,
          startTime TEXT,
          colorIndex INTEGER,
          isCompleted INTEGER,
          title TEXT,
          note TEXT,
          date TEXT 
          )
          ''').then((value) => print('create done'));
      },
      onOpen: (db) => print('database is opened'),
    ).then((value) => database = value).catchError((e) {
      print(e.toString());
    });
  }

  Future<List<Map<String, dynamic>>> getDataFromDatabase() async {
    return await database.rawQuery('SELECT * FROM Tasks');
  }

  Future<int> insertDataToDatabase(TaskModel taskModel) async {
    return await database.rawInsert('''
    INSERT INTO Tasks (title,note,date,startTime,endTime,colorIndex,isCompleted)
     VALUES(
     '${taskModel.title}',
     '${taskModel.note}',
     '${taskModel.date}',
     '${taskModel.startTime}',
     '${taskModel.endTime}',
     '${taskModel.colorIndex}',
     '${taskModel.isCompleted}'
     )
    ''');
  }

  Future<int> updateDataDatabase(int id) async {
    return await database.rawUpdate('''
    UPDATE Tasks SET isCompleted = ?  WHERE id = ?
    ''', [1, id]);
  }

  Future<int> deleteDataFromDatabase(int id) async {
    return await database.rawDelete('''
    DELETE FROM Tasks WHERE id = ?
    ''', [id]);
  }
}





