// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_4/bloc/m_78/name_bloc.dart';
import 'package:module_4/m_76.dart';
import 'package:module_4/m_77.dart';
import 'package:module_4/m_78.dart';

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
      home: MultiBlocProvider(
        providers: [
       
          BlocProvider(
            create: (context) => NameBloc(),
          ),
        ],
        child: M78(),
      ),
    );
  }
}
