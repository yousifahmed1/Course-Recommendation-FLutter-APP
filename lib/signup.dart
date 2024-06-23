import 'package:flutter/material.dart';
import 'package:ssa/home.dart';
import 'package:ssa/home2.dart';
import 'components.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class signup extends StatelessWidget{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Future<void> _signup(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.14/ssa/signup.php'),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
        'username': usernameController.text,
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
          builder: (context) => login(),
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
                SizedBox(height: 10,),
                //sign up
                Text("SIGN UP",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontFamily: "Somarsans",
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                //black box
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff070707),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(56),topLeft:Radius.circular(56) ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          //back button
                          Row(
                            children: [
                              IconButton(
                                  onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => login()));
                                  },
                                  icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                            ],
                          ),
                          SizedBox(height: 45,),
                          //name bar
                          bar("Name",usernameController),
                          SizedBox(height: 27,),
                          //email.bar
                          bar("Email",emailController),
                          SizedBox(height: 27,),
                          //password bar
                          bar("Password",passwordController),
                          SizedBox(height: 48,),
                          // sign up button
                          InkWell (
                            onTap: () {
                              // Handle button tap here
                              _signup(context);
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
                                  "Sign up",
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
                          // already have an acount
                          InkWell(
                            onTap: (
                                ) {
                              // Handle button tap here
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => login()));
                            },
                            child: Text("Already have an account ?",
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
