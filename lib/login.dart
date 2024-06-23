import 'package:flutter/material.dart';
import 'signup.dart';
import 'home2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class login extends StatelessWidget{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //database access area
  Future<void> _login(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.14/ssa/login.php'),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
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

    var data = json.decode(response.body);
    if (data == "Success") {
      // You can handle the response here, e.g., check for success or failure
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => home2(),
        ),
      );
      print('Login successful');
    } else {
      // Handle errors
      showErrorMessage(context,"Wrong data");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                //ssa text
                Text("SSA",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 90,
                    fontFamily: "Somarsans"
                  ),
                ),
                //Self Study Assistant
                Text ("Self Study Assistant",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Somarsans",
                      fontWeight: FontWeight.w400
                  ),

                ),
                SizedBox(height: 12,),
                //login
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff070707),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(80),topLeft: Radius.circular(80)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(height: 50,),
                          //login text
                          Text("LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontFamily: "SomarSans",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 60,),
                          //email bar
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
                              controller: emailController,
                              style: TextStyle(
                                color: Colors.white, // Change this to the desired text color
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 22,top: 19,bottom: 19),
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff606060),
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 27,),
                          //password bar
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
                              controller: passwordController,
                              style: TextStyle(
                                color: Colors.white, // Change this to the desired text color
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 22,top: 19,bottom: 19),
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff606060),
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 48,),
                          //login button
                          InkWell (
                            onTap: () {
                              // Handle button tap here
                              _login(context);
                            },
                            child: Container(
                              height: 52,
                              width: 178,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(39),
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight:FontWeight.w700,
                                      fontSize: 23
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          //dont have account
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => signup(),
                                ),
                              );
                            },
                            child: Text("Don’t have account ? Sign up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }}

