import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/features/tasks/data/TaskModel.dart';
import 'package:to_do/features/tasks/presention/cubit/task_cubit.dart';

class taskWidget extends StatelessWidget {
  TaskModel taskModel;
  taskWidget({required this.taskModel});
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


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Container(
            height: height * .15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: getColor(taskModel.colorIndex)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.title,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                          ),
                          SizedBox(width: 7.w),
                          Text(
                              '${taskModel.startTime} - ${taskModel.endTime}',
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                          width: width * .6,
                          child: Text(
                            taskModel.note,
                            style: GoogleFonts.lato(
                                color: Colors.grey[200],
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        height: height * .1,
                        width: width * .01,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      RotatedBox(
                          quarterTurns: 3,
                          child: taskModel.isCompleted == 1
                              ? Text(
                                  'Completed',
                                  style: GoogleFonts.acme(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20),
                                )
                              : Text(
                                  'TODO',
                                  style: GoogleFonts.acme(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22),
                                ))
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}

