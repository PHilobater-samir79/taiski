import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:to_do/core/local_Data/sqflite_Database.dart';
import 'package:to_do/core/service/services_locator.dart';
import 'package:to_do/features/tasks/data/TaskModel.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  int currentIndex = 0;
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime =
      DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 1)));
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleControl = TextEditingController();
  TextEditingController noteControl = TextEditingController();
  Future<DateTime?> showDate(BuildContext context) async {
    try {
      emit(getDateTaskLoading());
      var datePicker = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2025));
      emit(getDateTaskSuccess());
      BlocProvider.of<TaskCubit>(context).currentDate = datePicker!;
    } catch (e) {
      emit(getDateTaskFailure());
    }
  }

  Future<TimeOfDay?> startTimePicker(BuildContext context) async {
    try {
      emit(getStartTimeTaskLoading());
      var startTimePick = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(DateTime.now()));
      if (startTimePick != null) {
        emit(getStartTimeTaskSuccess());
        BlocProvider.of<TaskCubit>(context).startTime =
            startTimePick!.format(context);
      }
    } catch (e) {
      emit(getStartTimeTaskFailure());
    }
  }

  Future<TimeOfDay?> endTimePicker(BuildContext context) async {
    try {
      emit(getEndTimeTaskLoading());
      var endTimePick = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(DateTime.now()));
      if (endTimePick != null) {
        emit(getEndTimeTaskSuccess());
        BlocProvider.of<TaskCubit>(context).endTime =
            endTimePick!.format(context);
      }
    } catch (e) {
      emit(getEndTimeTaskFailure());
    }
  }

  Color getColor(index) {
    switch (index) {
      case 0:
        return Color(0xff546e7a);
      case 1:
        return Color(0xffFF4666);
      case 2:
        return Color(0xffCC8441);
      case 3:
        return Colors.teal;
      case 4:
        return Color(0xff7e57c2);
      case 5:
        return Color(0xffc51162);
      default:
        return Colors.indigo;
    }
  }

  void changeColorIndex(index) {
    try {
      emit(getColorTaskLoading());
      currentIndex = index;
      emit(getColorTaskSuccess());
    } catch (e) {
      emit(getColorTaskFailure());
    }
  }

  List<TaskModel> taskModelItemList = [];
  void InsertTask() async {
    try {
      emit(InsertTaskLoading());
      await getIt<SQFLiteHelper>().insertDataToDatabase(TaskModel(
          isCompleted: 0,
          date: DateFormat.yMd().format(currentDate),
          startTime: startTime,
          endTime: endTime,
          note: noteControl.text,
          colorIndex: currentIndex,
          title: titleControl.text));
      print(taskModelItemList);
      getTasks();
      titleControl.clear();
      noteControl.clear();
      emit(InsertTaskSuccess());
    } catch (e) {
      print(e.toString());
      emit(InsertTaskFailure());
    }
  }

  void getTasks() async {
    try {
      emit(getTaskLoading());
      await getIt<SQFLiteHelper>().getDataFromDatabase().then((value) {
        taskModelItemList = value
            .map((e) => TaskModel.fromJson(e))
            .toList()
            .where(
              (element) =>
                  element.date == DateFormat.yMd().format(selectedDate),
            )
            .toList();
        emit(getTaskSuccess());
      });
    } catch (e) {
      print(e.toString());
      emit(getTaskFailure());
    }
  }

  void updateTasks(id) async {
    emit(updateTaskLoading());
    try {
      await getIt<SQFLiteHelper>().updateDataDatabase(id).then((value) {
        emit(updateTaskSuccess());
        getTasks();
      });
    } catch (e) {
      print(e.toString());
      emit(updateTaskFailure());
    }
  }

  void deleteTask(id) async {
    emit(deleteTaskLoading());
    try {
      await getIt<SQFLiteHelper>().deleteDataFromDatabase(id).then((value) {
        emit(deleteTaskSuccess());
        getTasks();
      });
    } catch (e) {
      print(e.toString());
      emit(deleteTaskFailure());
    }
  }

  void selectedDateTask(date) {
    emit(selectedDateTaskLoading());
    try {
      selectedDate = date;
      emit(selectedDateTaskSuccess());
      getTasks();
    } catch (e) {
      print(e.toString());
      emit(selectedDateTaskFailure());
    }
  }
}


