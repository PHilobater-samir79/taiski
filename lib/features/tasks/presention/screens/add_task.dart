import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do/features/tasks/presention/cubit/task_cubit.dart';
import 'package:to_do/features/tasks/presention/screens/home_screen.dart';

class addTaskScreen extends StatelessWidget {
  static const String routeName = 'addTaskScreen';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleControl = TextEditingController();

  TextEditingController noteControl = TextEditingController();
  String title = '';

  String note = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, homeScreen.routeName);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
        ),
        title: Text('Add Task',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 25)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Tittle',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20)),
                    SizedBox(height: 10.h),
                    TextFormField(
                      onChanged: (text) {
                        title == text;
                      },
                      controller: titleControl,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: 'Enter Tittle Here',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text('Note',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20)),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      onChanged: (text) {
                        note == text;
                      },
                      controller: noteControl,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      maxLines: 5,
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: 'Enter Note Here',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text('Date',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20)),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      readOnly: true,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      autocorrect: true,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          counterStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: DateFormat.yMMMMd().format(
                              BlocProvider.of<TaskCubit>(context).currentDate),
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<TaskCubit>(context)
                                  .showDate(context);
                            },
                            icon: Icon(Icons.date_range_outlined),
                          ),
                          suffixIconColor: Colors.grey),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15.h),
                              Text('Start Time',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20)),
                              SizedBox(height: 10.h),
                              TextFormField(
                                readOnly: true,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                maxLines: 1,
                                autocorrect: true,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                    counterStyle:
                                        TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText:
                                        BlocProvider.of<TaskCubit>(context)
                                            .startTime,
                                    hintStyle: TextStyle(color: Colors.grey),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<TaskCubit>(context)
                                            .startTimePicker(context);
                                      },
                                      icon: Icon(Icons.access_time_filled),
                                    ),
                                    suffixIconColor: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15.h),
                              Text('End Time',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20)),
                              SizedBox(height: 10.h),
                              TextFormField(
                                readOnly: true,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                maxLines: 1,
                                autocorrect: true,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                    counterStyle:
                                        TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText:
                                        BlocProvider.of<TaskCubit>(context)
                                            .endTime,
                                    hintStyle: TextStyle(color: Colors.grey),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<TaskCubit>(context)
                                            .endTimePicker(context);
                                      },
                                      icon: Icon(Icons.access_time_filled),
                                    ),
                                    suffixIconColor: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: height * .1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Note Color',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20)),
                          SizedBox(height: 15.h),
                          Expanded(
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<TaskCubit>(context)
                                          .changeColorIndex(index);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          BlocProvider.of<TaskCubit>(context)
                                              .getColor(index),
                                      child: index ==
                                              BlocProvider.of<TaskCubit>(
                                                      context)
                                                  .currentIndex
                                          ? Icon(Icons.check)
                                          : null,
                                    ),
                                  );
                                },
                                itemCount: 10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Add New Task',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xfff242969),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      )),
    );
  }
}
