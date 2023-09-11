part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class getDateTaskLoading extends TaskState {}

class getDateTaskSuccess extends TaskState {}

class getDateTaskFailure extends TaskState {}

class getStartTimeTaskLoading extends TaskState {}

class getStartTimeTaskSuccess extends TaskState {}

class getStartTimeTaskFailure extends TaskState {}

class getEndTimeTaskLoading extends TaskState {}

class getEndTimeTaskSuccess extends TaskState {}

class getEndTimeTaskFailure extends TaskState {}

class getColorTaskLoading extends TaskState {}

class getColorTaskSuccess extends TaskState {}

class getColorTaskFailure extends TaskState {}

class InsertTaskLoading extends TaskState {}

class InsertTaskSuccess extends TaskState {}

class InsertTaskFailure extends TaskState {}


class getTaskLoading extends TaskState {}

class getTaskSuccess extends TaskState {}

class getTaskFailure extends TaskState {}


class updateTaskFailure extends TaskState {}

class updateTaskLoading extends TaskState {}

class updateTaskSuccess extends TaskState {}

class deleteTaskFailure extends TaskState {}

class deleteTaskLoading extends TaskState {}

class deleteTaskSuccess extends TaskState {}


class selectedDateTaskFailure extends TaskState {}

class selectedDateTaskLoading extends TaskState {}

class selectedDateTaskSuccess extends TaskState {}





