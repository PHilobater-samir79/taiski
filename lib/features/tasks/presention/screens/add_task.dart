import 'package:flutter/material.dart';
import 'package:to_do/features/tasks/presention/screens/home_screen.dart';

class addTaskScreen extends StatelessWidget {
  static const String routeName = 'addTaskScreen' ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            onPressed: (){
              Navigator.pushNamed(context, homeScreen.routeName);
            },icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,),
        ),
        title: Text('Add Task',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 25)),
        backgroundColor: Colors.black,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0,left: 30,right: 30),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Tittle',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20)),
              SizedBox(height: 10,),
              TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white
                ),
                maxLines: 1,
                autocorrect: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  counterStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  hintText: 'Enter Tittle Here',
                  hintStyle: TextStyle(color: Colors.grey),

                ),

              ),
              SizedBox(height: 15,),
              Text('Note',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20)),
              SizedBox(height: 10,),
              TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(
                    color: Colors.white
                ),
                maxLines: 5,
                autocorrect: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  counterStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  hintText: 'Enter Note Here',
                  hintStyle: TextStyle(color: Colors.grey),

                ),

              ),
              SizedBox(height: 15,),
              Text('Date',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20)),
              SizedBox(height: 10,),
              TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(
                    color: Colors.white
                ),
                maxLines: 1,
                autocorrect: true,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  counterStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  hintText: 'Enter Date Here',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.date_range_outlined),
                      ),
                  suffixIconColor: Colors.grey

                ),

              ),
              Row(

                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text('Start Time',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20)),
                        SizedBox(height: 10,),
                        TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white
                          ),
                          maxLines: 1,
                          autocorrect: true,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              counterStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              ),
                              hintText: 'Enter Time',
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.access_time_filled),
                              ),
                              suffixIconColor: Colors.grey

                          ),

                        ),

                      ],
                    ),
                  ),
                  SizedBox(width:10 ,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text('End Time',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20)),
                        SizedBox(height: 10,),
                        TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white
                          ),
                          maxLines: 1,
                          autocorrect: true,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              counterStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              ),
                              hintText: 'Enter Time',
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.access_time_filled),
                              ),
                              suffixIconColor: Colors.grey

                          ),

                        ),

                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Text('Note Color',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20)),
              SizedBox(height: 15,),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,

                  ),
                  SizedBox(width: 7,),
                  CircleAvatar(
                    backgroundColor: Colors.pink,

                  ),
                  SizedBox(width: 7,),
                  CircleAvatar(
                    backgroundColor: Colors.amber,

                  ),
                  SizedBox(width: 7,),
                  CircleAvatar(
                    backgroundColor: Colors.cyan,

                  ),
                  SizedBox(width: 7,),
                  CircleAvatar(
                    backgroundColor: Colors.purple,

                  ),
                  SizedBox(width: 7,),
                  CircleAvatar(
                    backgroundColor: Colors.deepOrangeAccent,

                  ),
                  SizedBox(width: 7,),
                  CircleAvatar(
                    backgroundColor: Colors.teal,

                  ),





                ],
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){}, child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Add New Task',style: TextStyle(fontSize: 20),),
              ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfff242969),

              ),
              )],
                ),
              )

          ),

    );
  }
}
