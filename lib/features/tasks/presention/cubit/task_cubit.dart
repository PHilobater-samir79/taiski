import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  DateTime currentDate = DateTime.now();
  int currentIndex = 0;
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime =
      DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 1)));

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
        return Colors.indigo;
      case 1:
        return Colors.deepPurple;
      case 2:
        return Colors.red;
      case 3:
        return Colors.teal;
      case 4:
        return Colors.cyan;
      case 5:
        return Colors.greenAccent;
      case 6:
        return Colors.blue;
      case 7:
        return Colors.brown;
      case 8:
        return Colors.white38;
      case 9:
        return Colors.green;
      default:
        return Colors.pink;
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
}
