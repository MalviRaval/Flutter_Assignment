//Write a program in android display screen color which the Color will be select from the radio button.

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: M57(),
    );
  }
}

enum colors {
  red,
  orange,
  yellow,
  green,
  blue,
  indigo,
  violet
}

class M57 extends StatefulWidget {
  const M57({super.key});

  @override
  State<M57> createState() => _M57State();
}

class _M57State extends State<M57> {
 // final int _selectedColor = 0;
 // var _result;
  var _selectValue = Colors.red;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      backgroundColor: _selectValue,
      body: Column(
        children: [
          ListTile(
            title: Text("Red"),
            leading: Radio(
              value: Colors.red,
              groupValue: _selectValue,
              onChanged: (value) {
                setState(() {
                  _selectValue = value!;
                });
              },
              activeColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text("Green"),
            leading: Radio(
              value: Colors.green,
              groupValue: _selectValue,
              onChanged: (value) {
                setState(() {
                  _selectValue = value!;
                });
              },
              activeColor: Colors.red,
            ),
          ),
          ListTile(
            title: Text("Purple"),
            leading: Radio(
              value: Colors.purple,
              groupValue: _selectValue,
              onChanged: (value) {
                setState(() {
                  _selectValue = value!;
                });
              },
              activeColor: Colors.red,
            ),
          ),
          ListTile(
            title: Text("Pink"),
            leading: Radio(
              value: Colors.pink,
              groupValue: _selectValue,
              onChanged: (value) {
                setState(() {
                  _selectValue = value!;
                });
              },
              activeColor: Colors.red,
            ),
          ),

        ],
      ),
    );
  }
}
