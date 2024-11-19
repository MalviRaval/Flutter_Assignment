// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors
//create an application to display Textview when checkbox is checked and hide otherwise

import 'package:flutter/material.dart';

class M55 extends StatefulWidget {
  const M55({super.key});

  @override
  State<M55> createState() => _M55State();
}

class _M55State extends State<M55> {
  bool checkBoxValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            checkBoxValue==true?Container(
                height: 50,
                child: Text("Check box value is $checkBoxValue")):Container(height: 50,),
            SizedBox.shrink(),
            CheckboxListTile(
              title: Text('True for text visible'),
                controlAffinity: ListTileControlAffinity.leading,
                value: checkBoxValue, onChanged: (value) {
              setState(() {
                checkBoxValue=value!;
              });

            })
          ],
        ),
      ),
    );
  }
}
