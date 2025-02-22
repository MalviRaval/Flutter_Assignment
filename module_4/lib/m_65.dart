
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class M65 extends StatefulWidget {
  const M65({super.key});

  @override
  State<M65> createState() => _M65State();
}

class _M65State extends State<M65> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context), // Intercept back button press
      child: Scaffold(
        appBar: AppBar(title: Text('Exit Confirmation')),
        body: Center(child: Text('Press back to exit the app')),
      ),
    );
  }

  _onWillPop(BuildContext context1) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Exit'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  //  Navigator.of(context).pop();
                  SystemNavigator.pop(); //
                  //exit(0);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
            ],
          );
        });
  }
}
