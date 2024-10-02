// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:module_3/Utils.dart';
import 'package:module_3/m51/m51_b.dart';

class M51A extends StatefulWidget {
  const M51A({super.key});

  @override
  State<M51A> createState() => _M51AState();
}

class _M51AState extends State<M51A> {
  final _startController = TextEditingController();
  final _endController = TextEditingController();

  var _startNumValidate = null;
  var _endNumValidate = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("M-51"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _startController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                      errorText: _startNumValidate,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter Start Number'),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: _endController,
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                  value!.isEmpty
                      ? 'Enter End Number'
                      : Utils.isValidNumber(value)
                      ? 'null'
                      : 'Enter a valid number',
                  decoration: InputDecoration(
                      errorText: _endNumValidate,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                      //errorText: 'Only Number Allow',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter End Number'),
                ),
                const SizedBox(
                  height: 22,
                ),
                OutlinedButton(
                    onPressed: () {
                      // print(_onPress());

                     _onPress();
                    },
                    //Navigator.pushNamed(context, 'M51B',arguments: );
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onPress() async {
    setState(() {
      _startNumValidate = _startController.text.isEmpty
          ? 'Enter Start Number'
          : Utils.isValidNumber(_startController.text)
          ? null
          : 'Enter a Valid Number';

      _endNumValidate = _endController.text.isEmpty
          ? 'Enter End Number'
          : Utils.isValidNumber(_endController.text)
          ? null
          : 'Enter Valid Number';
    });


    if(_startController.text.isNotEmpty && _endController.text.isNotEmpty){
      print(_startController.text);
      Map<String, dynamic> map = {};
      map['startRange']= _startController.text;
      map['endRange']=_endController.text;


      Navigator.push(context, MaterialPageRoute(
          builder: (context) => M51B(),
          settings: RouteSettings(
              arguments: map

          )));
    }

  }
}
