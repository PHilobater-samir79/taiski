import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/features/tasks/presention/screens/add_task.dart';
import 'package:to_do/features/tasks/presention/screens/task_widget.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen' ;

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String dateChoose = '' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800),),
              SizedBox(height: 10,),
              Text('Today',style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
              SizedBox(height: 8,),
              DatePicker(
                DateTime.now(),
                dateTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
                ),
                monthTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 10
                ),
                dayTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 10
                ),
                initialSelectedDate: DateTime.now(),
                selectionColor: Color(0xff242969),
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() {
                    dateChoose == date ;
                  });


                },
              ),
              SizedBox(height: 30,),

              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: taskWidget(),
                  );
                },),
              )







            ],

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton (
        onPressed: (){
          Navigator.pushNamed(context, addTaskScreen.routeName);
        },
        child: Icon(Icons.add,size: 30,color: Colors.white,),
        backgroundColor: Color(0xfff242969),
      ),

    );
  }
}






///Column(
//                 children: [
//                   Center(
//                       child: Image.asset('assets/images/home_image.png')),
//                   Text('What do you want to do today ? ',style: GoogleFonts.acme(textStyle: TextStyle(color: Colors.grey[300],fontSize: 22,fontWeight: FontWeight.w400)),),
//                   SizedBox(height: 8,),
//                   Text('Add Tasks Now !! ',style:GoogleFonts.lato(textStyle:TextStyle(color: Colors.grey[400],fontSize: 15,fontWeight: FontWeight.w400)),),
//
//                 ],
//               )