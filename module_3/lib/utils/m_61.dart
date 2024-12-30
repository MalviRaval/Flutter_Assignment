import 'package:flutter/material.dart';

import '../test/my_custompainter.dart';
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
      home: M61(),
    );
  }
}
class M61 extends StatefulWidget {
  //const M61({Key? key, required this.map}) : super(key: key);
//  final Map map;

  @override
  State<M61> createState() => _M61State();
}

class _M61State extends State<M61> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Column(children: [
          Flexible(
              flex: 1,
              child: Stack(children: [
                Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100),),
                      color: Colors.yellow,
                    ))
              ])),
          Flexible(
            flex: 5,
            child: Stack(children: [
              // Container(
              //   color: Colors.yellow,
              // ),
              //
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),topRight: Radius.circular(100)),
                  )),
              
            ]),
          )
        ]));}

      // body: Align(
      //   alignment: Alignment.bottomCenter,
      //   child: CustomPaint(
      //     painter: MyCustomPainter(),
      //     child: SizedBox(
      //       width: double.infinity,
      //       height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top,
      //       child: Center(child: Text('Cool!')),
      //     ),
      //   ),
      // ),

  }
