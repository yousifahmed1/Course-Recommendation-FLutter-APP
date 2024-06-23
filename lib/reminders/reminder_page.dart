import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssa/reminders/add_reminder_deadline.dart';
import '../courses/flutter_courses.dart';
import '../components.dart';
import 'reminders.dart';
import 'package:ssa/database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class reminder_page extends StatefulWidget {
  final String label;
  final DateTime selectedDate;
  reminder_page({
    required this.label,
    required this.selectedDate  ,
  });
  @override
  _reminder_page createState() => _reminder_page(label: label,selectedDate: selectedDate);
}
class _reminder_page extends State<reminder_page>{
  Future<void> deleteReminder() async {
    var url = Uri.parse('http://192.168.1.14/ssa/delete_reminder.php');

    var response = await http.post(url, body: {
      'deadline': DateFormat('yyyy-MM-dd').format(selectedDate),
      "label" : label,
    });
      if (response.statusCode == 200) {
        // Process the response as needed
        print('Attendance deleted successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => allreminders(),
          ),
        );

      } else {
        // Handle errors
        print('Failed to delete attendance');
      }
  }
  DateTime selected_Date = DateTime.now();
  final String label;
  late final DateTime selectedDate;
  _reminder_page({
    required this.label,
    required this.selectedDate  ,
  });
  void showErrorMessage(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  Future<void> _sendDateToDatabase(BuildContext context) async {
    final String url = 'http://192.168.1.14/ssa/update_reminder.php'; // Replace with your PHP script URL
    final response = await http.post(
      Uri.parse(url),
      body: {
        'selected_date_before': DateFormat('yyyy-MM-dd').format(selectedDate),
        'selected_date_after': DateFormat('yyyy-MM-dd').format(selected_Date),
        "label_before" : label,
        "label_after" : reminder_label.text,
      },
    );
    if (response.statusCode == 200) {
      // Process the response as needed
      print('Attendance deleted successfully');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => allreminders(),
        ),
      );
    } else {
      // Handle errors
      print('Failed to delete attendance');
    }
  }
  TextEditingController reminder_label = TextEditingController();
  TextEditingController reminder_deadline = TextEditingController();
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
                    "Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SomarSans",
                      fontSize: 28,
                      fontWeight: FontWeight.w400,


                    ),
                  ),
                  SizedBox(height: 125,),
                  Container(

                    decoration: BoxDecoration(
                        color: Color(0xff121212),
                        borderRadius: BorderRadius.circular(23),
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
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () async{
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selected_Date,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null ) {
                        setState((){
                          selected_Date = picked;
                        }
                        );
                      };
                    },
                    child: Container(
                      width: 342,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Color(0xff121212),
                        borderRadius: BorderRadius.circular(23),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.01),
                            offset: Offset(4.0, 4.0),
                            blurRadius: 26,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.01),
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 26,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Select Date",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 21,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  InkWell (
                    onTap: () {_sendDateToDatabase(context);
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
                          "Submit",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight:FontWeight.w700,
                              fontSize: 21
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  InkWell (
                    onTap: () {
                      deleteReminder();

                    },
                    child: Container(
                      height: 43,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xffEF1C1C),
                        borderRadius: BorderRadius.circular(39),
                      ),
                      child: Center(
                        child: Text(
                          "Delete",
                          style: TextStyle(
                              color: Colors.white,
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
