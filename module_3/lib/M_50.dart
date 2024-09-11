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
      home: const M50(),
    );
  }
}

class M50 extends StatefulWidget {
  const M50({super.key});

  @override
  State<M50> createState() => _M50State();
}

class _M50State extends State<M50> {
  String? inputTextStr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("M50",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,  ),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value){
                  inputTextStr=value;
                  print(inputTextStr);
              },

              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                labelText: "Enter number",
                fillColor: Colors.white70,
              ),
              keyboardType: TextInputType.number,
              maxLines: 1,
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: const Text(
                  'Print',
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
