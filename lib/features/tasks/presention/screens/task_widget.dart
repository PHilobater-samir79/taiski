import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/features/tasks/data/TaskModel.dart';
import 'package:to_do/features/tasks/presention/cubit/task_cubit.dart';
import 'package:to_do/features/tasks/presention/screens/home_screen.dart';

class taskWidget extends StatelessWidget {
  TaskModel taskModel;
  taskWidget({required this.taskModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: () {
          bottomSheet(context);
        },
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return Container(
              height: height * .15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: BlocProvider.of<TaskCubit>(context)
                    .getColor(BlocProvider.of<TaskCubit>(context).currentIndex),
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
                          taskModel.tittle,
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
                                  color: Colors.grey[300],
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
                            child: taskModel.isCompleted
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
      ),
    );
  }
}

void bottomSheet(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: height * .25,
          width: width,
          decoration: BoxDecoration(color: Color(0xff424242)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff242969)),
                        child: Text(
                          'Task Completed',
                          style: GoogleFonts.acme(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ))),
                SizedBox(height: 10.h),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: Text(
                          'Delete Task',
                          style: GoogleFonts.acme(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ))),
                SizedBox(height: 10.h),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, homeScreen.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.acme(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ))),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      });
}
