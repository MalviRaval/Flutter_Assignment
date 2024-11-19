// ignore_for_file: prefer_const_constructors
//create an application to increate font size when plus button click and decrease when minus button click
import 'package:flutter/material.dart';

class M54 extends StatefulWidget {
  const M54({super.key});

  @override
  State<M54> createState() => _M54State();
}

class _M54State extends State<M54> {
  double fontSize=12.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {
              setState(() {
                if(fontSize!=0){
                  fontSize++;
                }else{
                  fontSize=1.0;
                }
              });
            }, icon: Icon(Icons.add,size: 40,)),
            Text("${fontSize}",
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
            IconButton(onPressed: () {
              setState(() {
                if(fontSize!=0){
                  fontSize--;
                }else{
                  fontSize =1.0;
                }
              });
            }, icon: Icon(Icons.remove,size: 40,)),
          ],
        ),
      ),
    );
  }
}
