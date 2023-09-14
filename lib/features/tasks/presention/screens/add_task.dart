import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do/features/tasks/presention/cubit/task_cubit.dart';
import 'package:to_do/features/tasks/presention/screens/home_screen.dart';

class addTaskScreen extends StatelessWidget {
  static const String routeName = 'addTaskScreen';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
              child: BlocConsumer<TaskCubit, TaskState>(
                listener: (context, state) {
                  if(state is InsertTaskSuccess){
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom!),
                      child: Form(
                        key: BlocProvider.of<TaskCubit>(context).formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        Text('Tittle',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (validate)
                          {
                            if(validate!.isEmpty)
                            {
                              return 'Please Enter Title' ;
                            }
                          },
                          controller: BlocProvider.of<TaskCubit>(context).titleControl,
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
                          height: 15,
                        ),
                        Text('Note',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: BlocProvider.of<TaskCubit>(context).noteControl,
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
                          height: 15,
                        ),
                        Text('Date',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        SizedBox(
                          height: 10,
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
                                  BlocProvider.of<TaskCubit>(context)
                                      .currentDate),
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
                                  SizedBox(height: 15),
                                  Text('Start Time',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20)),
                                  SizedBox(height: 10),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 15),
                                  Text('End Time',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20)),
                                  SizedBox(height: 10),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                        SizedBox(height: 10),
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
                              SizedBox(height: 15),
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
                                    itemCount: 6
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        state is InsertTaskLoading ?
                        Center(
                            child: CircularProgressIndicator(color: Colors.indigo,)) :
                        ElevatedButton(
                          onPressed: () {
                            if(BlocProvider.of<TaskCubit>(context).formKey.currentState!.validate()){
                              BlocProvider.of<TaskCubit>(context).InsertTask();
                            }
                          },
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
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
    );
  }
}
