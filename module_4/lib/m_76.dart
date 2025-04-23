import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:module_4/extra/second_screen.dart';

class M76 extends StatefulWidget {
  const M76({super.key});

  @override
  State<M76> createState() => _M76State();
}

class _M76State extends State<M76> {
  TextEditingController num1Controller = TextEditingController();

  TextEditingController num2Controller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M76'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Number 1';
                  }
                  return null;
                },
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number 1',
                  hintText: 'Number 1',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Number 2';
                  }
                  return null;
                },
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number 2',
                  hintText: 'Number 2',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String num1 = num1Controller.text;
                  String num2 = num2Controller.text;

                  if (formKey.currentState!.validate()) {
                    int sum = int.parse(num1) + int.parse(num2);
                    num1Controller.clear();
                    num2Controller.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            sum: sum.toString(),
                          ),
                        ));
                  }

                  //print('Name: $name, Email: $email');
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }
}
