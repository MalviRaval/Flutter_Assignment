import 'package:flutter/material.dart';

class M64 extends StatefulWidget {
  const M64({super.key});

  @override
  State<M64> createState() => _M64State();
}

class _M64State extends State<M64> {
  List cityList = [
    'Surat',
    'Ahmedabad',
    'Bharuch',
    'Vadodara',
    'Anand',
    'Rajkot',
    'Bhavanagar'
  ];

  String selectedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert dialog open'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                child: const Text('Show city dialog')),
            selectedCity.isNotEmpty
                ? Text('Selected City: $selectedCity')
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget setupAlertDialoadContainer() {
    return SizedBox(
      height: 300.0,
      width: 300.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cityList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              setState(() {
                selectedCity = cityList[index];
              });

              Navigator.of(context).pop();
            },
            title: Text('${cityList[index]}'),
          );
        },
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Country List'),
            content: setupAlertDialoadContainer(),
          );
        });
  }
}
