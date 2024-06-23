import 'package:flutter/material.dart';
import 'login.dart';
Widget bar (String txt,TextEditingController controller){
  return Container(

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
      controller: controller,
      style: TextStyle(
        color: Colors.white, // Change this to the desired text color
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 22,top: 19,bottom: 19),
          border: InputBorder.none,
          hintText: txt,
          hintStyle: TextStyle(
            fontSize: 17,
            color: Color(0xff606060),
            fontWeight: FontWeight.bold,
          )
      ),
    ),
  );
}
Widget btn (context , String label,Widget page) {
  return InkWell (
    onTap: () {
      // Handle button tap here
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page));

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
            label,
          style: TextStyle(
          color: Colors.black,
            fontWeight:FontWeight.w700,
          fontSize: 19
        ),
        ),
      ),
    ),
  );
}
Widget btn2 ({
  required context,
  required String label,
  required Widget page,
  required double container_h,
  required double container_w,
  required Color container_color,
  required Color text_color,
  required double text_size,
}
) {
  return InkWell (
    onTap: () {
      // Handle button tap here
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page));

    },
    child: Container(
      height: container_h,
      width: container_w,
      decoration: BoxDecoration(
        color: container_color,
          borderRadius: BorderRadius.circular(39),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
          color: text_color,
          fontWeight:FontWeight.w700,
          fontSize: text_size
        ),
        ),
      ),
    ),
  );
}