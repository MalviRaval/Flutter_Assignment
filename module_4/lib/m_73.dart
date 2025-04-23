import 'dart:async';

import 'package:flutter/material.dart';
import 'package:module_4/extra/home_screen.dart';

class M73 extends StatefulWidget {
  const M73({super.key});

  @override
  State<M73> createState() => _M73State();
}

class _M73State extends State<M73> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacement(context, _createRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
