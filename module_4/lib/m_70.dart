// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:module_4/navigation/audio_page.dart';
import 'package:module_4/navigation/gallery_page.dart';
import 'package:module_4/navigation/video_page.dart';

class M70 extends StatefulWidget {
  const M70({super.key});

  @override
  State<M70> createState() => _M70State();
}

class _M70State extends State<M70> {
  int _selectedIndex = 0;
  List<Widget> _pagesIndex = [GalleryPage(), AudioPage(), VideoPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bottom Navigation Example'),
        ),
        body: _pagesIndex[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Gallery'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Audio'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Video'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ));
  }

}
