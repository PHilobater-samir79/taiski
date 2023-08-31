import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/features/tasks/presention/screens/home_screen.dart';

class taskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: (){
          bottomSheet(context);
        },
        child: Container(
          height: height * .15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.indigo,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title',style: GoogleFonts.lato(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.access_time,color: Colors.white,),
                        SizedBox(width: 7,),
                        Text('09:33 PM - 09:48 PM',style: GoogleFonts.lato(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width:width*.6 ,
                        child: Text('Note',style: GoogleFonts.lato(color: Colors.grey[300],fontSize: 15 ,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,)),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      height: height*.1,
                      width: width*.01,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2)

                      ),
                    ),
                    RotatedBox(
                        quarterTurns: 3,
                        child: Text('complete',style: GoogleFonts.acme(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20),))

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void bottomSheet (BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: height*.25 ,
      width: width,
      decoration: BoxDecoration(
            color: Color(0xff424242)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff242969)
                ),
                child: Text('Task Completed',style: GoogleFonts.acme(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),) )),
            SizedBox(height: 10,),
            Expanded(child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                ),
                child: Text('Delete Task',style: GoogleFonts.acme(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),) )),
            SizedBox(height: 10,),
            Expanded(
                child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, homeScreen.routeName);
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple
                ),
                child: Text('Cancel',style: GoogleFonts.acme(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),) )),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  });
}

