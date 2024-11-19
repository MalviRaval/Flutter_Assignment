// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
//Write a program to show four images around Textview.
import 'package:flutter/material.dart';

class M56 extends StatefulWidget {
  const M56({super.key});

  @override
  State<M56> createState() => _M56State();
}

class _M56State extends State<M56> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_rowContainer(), _rowContainer2()],
              ),
            ),
          ),
          Center(child: Text("data",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 33),))
        ],
      ),
    );
  }

  _rowContainer() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.green,
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.purple,
            ),
          )
        ],
      ),
    );
  }

  _rowContainer2() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.pink,
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}
