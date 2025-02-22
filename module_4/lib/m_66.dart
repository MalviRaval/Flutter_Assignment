import 'package:flutter/material.dart';

class M66 extends StatefulWidget {
  const M66({super.key});

  @override
  State<M66> createState() => _M66State();
}

class _M66State extends State<M66> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _selectDate(context);
            },
            child: const Text('Open Date Picker')),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
