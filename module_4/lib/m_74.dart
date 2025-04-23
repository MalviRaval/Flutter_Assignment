//Create an Android Application which Manage Activity Lifecycle Stages and Showing Toast with Performing Different Stages.

import 'package:flutter/material.dart';
import 'package:module_4/extra/home_screen.dart';

class M74 extends StatefulWidget {
  const M74({super.key});

  @override
  State<M74> createState() => _M74State();
}

class _M74State extends State<M74> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
          child: Text(
        'Click the button to show the second screen',
        style: TextStyle(fontSize: 18),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
