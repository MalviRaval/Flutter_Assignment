import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Audio Screen',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ));
  }
}