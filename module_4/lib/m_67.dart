import 'package:flutter/material.dart';

class M67 extends StatefulWidget {
  const M67({super.key});

  @override
  State<M67> createState() => _M67State();
}

class _M67State extends State<M67> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Option Menu'),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Profile':
        break;
      case 'Logout':
        break;
    }
  }
}
