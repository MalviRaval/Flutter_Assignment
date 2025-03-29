import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class M72 extends StatefulWidget {
  const M72({super.key});

  @override
  State<M72> createState() => _M72State();
}

class _M72State extends State<M72> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Phone call App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: 'Enter the phone number',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _makePhoneCall('tel:1234567890');
                  },
                  child: Text('Phone call')),
            ],
          ),
        ),
      ),
    );
  }

  _makePhoneCall(String s) {
    // return
  }
}
