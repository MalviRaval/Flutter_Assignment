// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String sum;
  const SecondScreen({
    super.key,
    required this.sum,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second screen')),
      body: Center(
        child: Text(
          sum,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
