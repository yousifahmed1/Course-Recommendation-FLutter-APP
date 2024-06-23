import 'package:flutter/material.dart';
import 'package:ssa/reminders/reminder_page.dart';
import '../courses/flutter_courses.dart';
import '../components.dart';
import 'add_reminder_name.dart';
import '../database.dart';
import 'package:ssa/home2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class allreminders extends StatefulWidget {
  @override
  _reminderPageState createState() => _reminderPageState();
}
class _reminderPageState extends State<allreminders>{
  List<Map<String, dynamic>> reminderss = [];
  final database dataSource = database();
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
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
                              MaterialPageRoute(builder: (context) => home2()));
                        },
                        child: Image.asset('assets/back.png')),
                  ],
                ),
                SizedBox(height: 20,),
                //reminder text and add reminder button
                Row(
                  children: [
                    //reminders text
                    Expanded(
                      child: Text("Reminders",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          fontFamily: "SomarSans",
                        ),

                      ),
                    ),
                    //btn
                    btn2(context: context ,label: "Add reminder", page: add_reminder_name(), container_h: 33, container_w: 92, container_color: Colors.white, text_color: Colors.black, text_size: 13),

                  ],
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount:reminderss.length,
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
              ],
            ),
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


