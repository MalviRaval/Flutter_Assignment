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
      home: M58(),
    );
  }
}


class M58 extends StatefulWidget {
  const M58({super.key});

  @override
  State<M58> createState() => _M58State();
}

class _M58State extends State<M58> {
  bool _selectCheckBox=true;
  double _value1=0.0;
  double _value2=0.0;
  double _value3=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(_value1.toInt(), _value2.toInt(), _value3.toInt(), 1.0),
      appBar: AppBar(
        title: Text("Hide and Show"),
      ),
      body:Column(
        children: [
          Slider(
            min: 0.0,
            max: 255.0,
            value: _value1,
            onChanged: (value) {
              setState(() {
                _value1 = value;
              });
            },
          ),
          Slider(
            min: 0.0,
            max: 255.0,
            value: _value2,
            onChanged: (value) {
              setState(() {
                _value2 = value;
              });
            },
          ),
          Slider(
            min: 0.0,
            max: 255.0,
            value: _value3,
            onChanged: (value) {
              setState(() {
                _value3 = value;
              });
            },
          )
        ],
      )

    );
  }
}
