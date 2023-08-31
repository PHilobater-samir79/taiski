import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/add_task/add_task.dart';

class homeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen' ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('May 10,2023',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800),),
              SizedBox(height: 10,),
              Text('Today',style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
              SizedBox(height: 8,),
              CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) {
                },
                leftMargin: 20,
                monthColor: Colors.grey,
                dayColor: Colors.grey,
                activeDayColor: Colors.white,
                activeBackgroundDayColor: Color(0xfff242969),
                selectableDayPredicate: (date) => true,
                locale: 'en_ISO',
              ),
              SizedBox(height: 30,),
              Column(
                children: [
                  Center(
                      child: Image.asset('assets/images/home_image.png')),
                  Text('What do you want to do today ? ',style: TextStyle(color: Colors.grey[300],fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(height: 8,),
                  Text('Add Tasks Now !! ',style: TextStyle(color: Colors.grey[400],fontSize: 15,fontWeight: FontWeight.w400),),

                ],
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
