import 'package:flutter/material.dart';
import 'package:ssa/reminders/add_reminder_deadline.dart';
import 'reminders.dart';
class add_reminder_name extends StatelessWidget{
  TextEditingController reminder_label = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff070707),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  //back button
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            // Handle button tap here
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => allreminders()));

                          },
                          child: Image.asset('assets/back.png')),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "New reminder",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SomarSans",
                      fontSize: 28,
                      fontWeight: FontWeight.w400,


                    ),
                  ),
                  SizedBox(height: 204,),
                  Container(

                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(23),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.01),
                              offset: Offset(4.0,4.0),
                              blurRadius: 26,
                              spreadRadius: 0
                          ),
                          BoxShadow(
                              color: Colors.white.withOpacity(0.01),
                              offset: Offset(-4.0,-4.0),
                              blurRadius: 26,
                              spreadRadius: 0
                          ),


                        ]
                    ),

                    child: TextFormField(
                      controller: reminder_label,
                      style: TextStyle(
                        color: Colors.white, // Change this to the desired text color
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 22,top: 19,bottom: 19),
                          border: InputBorder.none,
                          hintText: "Enter reminder name",
                          hintStyle: TextStyle(
                            fontSize: 17,
                            color: Color(0xff606060),
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 115,),
                  InkWell (
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddReminderDeadline(label:reminder_label.text ,)));

                    },
                    child: Container(
                      height: 43,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(39),
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight:FontWeight.w700,
                              fontSize: 21
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }}
