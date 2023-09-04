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
