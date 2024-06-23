import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:ssa/reminders/reminders.dart';

class AddReminderDeadline extends StatefulWidget {
  final String label;
  AddReminderDeadline({
    required this.label,
  });
  @override
  _AddReminderDeadlineState createState() => _AddReminderDeadlineState(label: label);
}
class _AddReminderDeadlineState extends State<AddReminderDeadline> {
  final String label;
  _AddReminderDeadlineState({
    required this.label,
  });
  TextEditingController reminderLabel = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
  }
  Future<void> _sendDateToDatabase(BuildContext context) async {
    final String url = 'http://192.168.1.14/ssa/send_Reminder.php'; // Replace with your PHP script URL
    final response = await http.post(
      Uri.parse(url),
      body: {
        'selected_date': DateFormat('yyyy-MM-dd').format(selectedDate),
        "label" : label,
      },
    );
    var data = json.decode(response.body);
    if (data == "Success") {
      // You can handle the response here, e.g., check for success or failure
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => allreminders(),
        ),
      );
      print('Login successful');
    } else {
      // Handle errors
      showErrorMessage(context,"error data");
    }
  }
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff070707),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/back.png'),
                    ),
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
                Text("${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}",
                  style: TextStyle(
                    color: Colors.white,
                  ),

                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () async{
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null ) {
                      setState((){
                        selectedDate = picked;
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
                SizedBox(height: 20,),
                SizedBox(height: 115,),
                InkWell(
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
                          fontWeight: FontWeight.w700,
                          fontSize: 21,
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
    );
  }
}
