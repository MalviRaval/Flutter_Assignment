import 'package:flutter/material.dart';
import 'dart:math' as math;


//create an application to change background when button is clicked

class m53 extends StatefulWidget {
  const m53({super.key});

  @override
  State<m53> createState() => _m53State();
}

class _m53State extends State<m53> {
  Color strColor=Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        color:strColor,
        alignment: Alignment.center,
        child: TextButton(onPressed: (){
         setState(() {
           strColor=Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
         });
        }, child: Text("Click to Change color",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),
      ),

    ));
  }
}
