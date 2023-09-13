import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do/core/service/notifications.dart';
import 'package:to_do/features/tasks/data/TaskModel.dart';
import 'package:to_do/features/tasks/presention/cubit/task_cubit.dart';
import 'package:to_do/features/tasks/presention/screens/add_task.dart';
import 'package:to_do/features/tasks/presention/screens/task_widget.dart';


class homeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String dateChoose = '';
  int? indexList ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Today',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DatePicker(
                    DateTime.now(),
                    dateTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    monthTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 10),
                    dayTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 10),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Color(0xff242969),
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      BlocProvider.of<TaskCubit>(context).selectedDateTask(date);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BlocProvider.of<TaskCubit>(context).taskModelItemList.isEmpty
                      ? Expanded(
                        child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Image.asset(
                                      'assets/images/home_image.png')),
                              Text(
                                'What do you want to do today ? ',
                                style: GoogleFonts.acme(
                                    textStyle: TextStyle(
                                        color: Colors.grey[300],
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Add Tasks Now !! ',
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                      )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: BlocProvider.of<TaskCubit>(context)
                                .taskModelItemList
                                .length,
                            itemBuilder: (context, indexList) {

                               return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: InkWell(
                                  onTap: (){
                                    bottomSheet(index: indexList);
                                  },
                                  child: taskWidget(
                                      taskModel:
                                          BlocProvider.of<TaskCubit>(context)
                                              .taskModelItemList[indexList]),
                                ),

                              );

                            },
                          ),
                        )
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, addTaskScreen.routeName);
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: Color(0xfff242969),
      ),
    );
  }
  void bottomSheet({required int index}) {
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
                  BlocProvider.of<TaskCubit>(context).taskModelItemList[index].isCompleted == 1 ? Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellow
                      ),
                      child: Center(child: Text('This Task Completed already', style: GoogleFonts.akronim(color: Colors.black,fontSize: 20),)),
                    ),
                  ) :
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<TaskCubit>(context).updateTasks(BlocProvider.of<TaskCubit>(context).taskModelItemList[index].id);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff242969)),
                          child: Text(
                            'Task Completed',
                            style: GoogleFonts.acme(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ))),
                  SizedBox(height: 10),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: (){
                            BlocProvider.of<TaskCubit>(context).deleteTask(BlocProvider.of<TaskCubit>(context).taskModelItemList[index].id);
                            Navigator.pop(context);
                          } ,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: Text(
                            'Delete Task',
                            style: GoogleFonts.acme(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ))),
                  SizedBox(height: 10),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
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
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        });
  }


}
