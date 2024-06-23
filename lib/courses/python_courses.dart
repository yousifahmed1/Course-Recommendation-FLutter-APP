// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ssa/home2.dart';
import 'package:url_launcher/url_launcher.dart';

class python_c extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070707),
      body: Padding(
        padding: const EdgeInsets.only(top: 60,left: 20,right: 20),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        // Handle button tap here
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => home2()));

                      },
                      child: Image.asset('assets/back.png')
                  ),
                ],
              ),
              SizedBox(height: 20,),

              Text(
                "Top Python Courses\n In Udemy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SomarSans",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 15,),
              Container(
                  height: 2,
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(39),)
              ),
              SizedBox(height: 36,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Course_Box(
                          course_name: "100 Days of Code: The Complete Python Pro Bootcamp for 2023",
                          txt_size: 17,
                          inst: "Dr. Angela Yu",
                          img: "assets/Dr.-Angela-Yu.png",
                          rate: "4.7",
                          rates: "257,455",
                          students: "1,110,935",
                          price: "1,599 EGP",
                          url: "https://www.udemy.com/course/100-days-of-code/"
                      ),
                      SizedBox(height: 14,),
                      Course_Box(
                          course_name: "The Complete Python Bootcamp From Zero to Hero in Python",
                          txt_size: 17,
                          inst: "Jose Portilla",
                          img: "assets/Jose-Portilla.png",
                          rate: "4.6",
                          rates: "488,629",
                          students: "1,829,035",
                          price: "1,699 EGP",
                          url: "https://www.udemy.com/course/complete-python-bootcamp/"
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }}

Widget Course_Box ({
  required String course_name,
  required double txt_size,
  required String inst,
  required String img,
  required String rate,
  required String rates,
  required String students,
  required String price,
  required String url
}) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xff121212),
      borderRadius: BorderRadius.circular(35),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 73,
                width: 73,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                      image: AssetImage(img
                      )
                  ),

                ),

              ),
              SizedBox(width: 7,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course_name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "SomarSans",
                        fontSize: txt_size,
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                    SizedBox(height: 9,),
                    Text(inst,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "SomarSans",
                        fontSize: 17,
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 19,),
          Row(
            children: [
              Text("Rate : "+rate,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SomarSans",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),

              ),
              SizedBox(width: 3,),
              Icon(Icons.star,color: Color(0xffFFD600),size:17,),
              SizedBox(width: 3,),
              Text("("+rates+")",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SomarSans",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),

              ),
            ],
          ),
          SizedBox(height: 13,),
          Text("Students : "+students,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Somar Sans",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),

          ),
          SizedBox(height: 26,),
          Row(
            children: [
              Expanded(
                child: Text("Price : "+price,
                  style: TextStyle(
                    color: Color(0xffD9CAB3),
                    fontFamily: "Somar Sans",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),

                ),
              ),
              InkWell(
                onTap: () async {
                  await launch(url);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color(0xff6D9886),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25,vertical: 13),
                    child: Text("View",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Somar Sans",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),

                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );


}

