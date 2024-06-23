import 'package:flutter/material.dart';
import 'courses/flutter_courses.dart';
class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070707),
      body: Padding(
        padding: const EdgeInsets.only(top: 76,left: 20,right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "SomarSans",
                        ),

                      ),
                      Text("Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          fontFamily: "SomarSans",
                        ),

                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),

                    child: CircleAvatar(
                      radius: 25,
                    backgroundColor: Color(0xff070707),
                      child: Image.asset('assets/profile.png',),

                  ),
                ),
              ]
            ),
            SizedBox(height: 18,),
            Container(
              height: 2,
              width: 330,
              decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(39),)
            ),
            SizedBox(height: 35,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Course Recommendation",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,

                      ),

                    ),
                    Text("In Udemy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,

                      ),

                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32,),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // Handle button tap here
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => flutter_c()));
                  },
                  child: Container(
                    width: 178,
                    height: 268,
                    decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 54,),
                        Image.asset('assets/flutter.png'),
                        SizedBox(height: 35,),

                        Text("Flutter",
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: "SomarSans",
                          fontWeight: FontWeight.w500
                        ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 268,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                ),
                Container(
                  width: 178,
                  height: 268,
                  decoration:BoxDecoration(
                    color: Color(0xffD9CAB3),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 54,),
                      Image.asset('assets/network.png'),
                      SizedBox(height: 35,),

                      Text("Network",
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: "SomarSans",
                            fontWeight: FontWeight.w500
                        ),)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 33,),
            Row(
              children: [
                Container(
                  width: 178,
                  height: 268,
                  decoration:BoxDecoration(
                    color: Color(0xff1C1C1C),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 54,),
                      Image.asset('assets/python.png'),
                      SizedBox(height: 35,),

                      Text("Python",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontFamily: "SomarSans",
                            fontWeight: FontWeight.w500
                        ),)
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 268,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                ),
                Container(
                  width: 178,
                  height: 268,
                  decoration:BoxDecoration(
                    color: Color(0xff6D9886),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 54,),
                      Image.asset('assets/web.png'),
                      SizedBox(height: 35,),

                      Text("Web",
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: "SomarSans",
                            fontWeight: FontWeight.w500
                        ),)
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }}
