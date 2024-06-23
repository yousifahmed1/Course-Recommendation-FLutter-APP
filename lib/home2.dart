import 'package:flutter/material.dart';
import 'package:ssa/courses/network_courses.dart';
import 'package:ssa/courses/python_courses.dart';
import 'package:ssa/courses/web_courses.dart';
import 'package:ssa/reminders/reminder_page.dart';
import 'courses/flutter_courses.dart';
import 'reminders/reminders.dart';
import 'database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home2 extends StatefulWidget {
  @override
  _home2 createState() => _home2();
}
class _home2 extends State<home2>{
  final database dataSource = database();
  List<Map<String, dynamic>> reminderss = [];
  @override
  void initState() {
    super.initState();
    fetchreminder();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff070707),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              //welcome back text
              Text("Welcome Back",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SomarSans",
                ),
              ),
              SizedBox(height: 30,),
              //courses for you
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Courses for you",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "SomarSans",
                        ),
                      ),
                    ),
                    Text("View all",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: "SomarSans",
                        decoration: TextDecoration.underline,


                      ),

                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              //course row
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      courses_contaitner(label: "Flutter", label2: "5 courses", image_path: 'assets/flutter.png', context: context, cont_color: Colors.white,page: flutter_c()),
                      SizedBox(width: 20,),
                      courses_contaitner(label: "Network Courses", label2: "5 courses", image_path: 'assets/network.png', context: context, cont_color: Color(0xffD9CAB3),page: network_c() ),
                      SizedBox(width: 20,),
                      courses_contaitner(label: "Web Courses", label2: "5 courses", image_path: 'assets/web.png', context: context, cont_color: Color(0xffD6D9886),page: web_c() ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () {
                          // Handle button tap here
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => python_c()));

                        },

                        child: Container(
                          width: 243,
                          height: 212,
                          decoration: BoxDecoration(
                            color: Color(0xffD121212),
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                      'assets/python.png'
                                  ),
                                ),
                                SizedBox(height: 25,),
                                Text("Python Courses",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "SomarSans",
                                  ),

                                ),
                                SizedBox(height: 5,),
                                Text("5 Course",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "SomarSans",
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //remiders text
              Padding(
                padding: const EdgeInsets.only(right: 25,left: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Reminders",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: "SomarSans",
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Handle button tap here
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => allreminders()));

                      },

                      child: Text("View all..",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          fontFamily: "SomarSans",
                          decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              //reminders
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Handle button tap here
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => reminder_page(label: reminderss[index]['label'],selectedDate: DateTime.parse(reminderss[index]['deadline']))));

                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffD121212),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(reminderss[index]['label'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "SomarSans",
                                            ),

                                          ),
                                          SizedBox(height: 4,),
                                          Text(reminderss[index]['deadline'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: "SomarSans",
                                            ),

                                          ),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(35),

                                      ),
                                      child:Icon(
                                        Icons.arrow_back_ios_sharp,color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 11,),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> fetchreminder() async {
    final response = await http.post(
      Uri.parse('http://192.168.1.14/ssa/reminders.php'), // Replace with your actual PHP script URL
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        reminderss = List<Map<String, dynamic>>.from(data);
      });
    } else {
      throw Exception('Failed to load groups');
    }
  }
}
Widget courses_contaitner({
  required context,
  required String label,
  required String label2,
  required String image_path,
  required Color cont_color,
  required Widget page,
})
{
  return InkWell(
    onTap: () {
      // Handle button tap here
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page));

    },
    child: Container(
      width: 243,
      height: 212,
      decoration: BoxDecoration(
        color: cont_color,
        borderRadius: BorderRadius.circular(40),

      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Image.asset(image_path)
            ),
            SizedBox(height: 21,),
            Text(label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "SomarSans",
              ),

            ),
            SizedBox(height: 5,),
            Text(label2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: "SomarSans",
              ),
            ),
          ],
        ),
      ),
    ),
  );
}





