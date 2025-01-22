// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class M61 extends StatefulWidget {
  const M61({super.key});

  @override
  State<M61> createState() => _M61State();
}

class _M61State extends State<M61> {
  bool _isSearching = false;
  final key = new GlobalKey<ScaffoldState>();
  String _searchText = "";
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list = [];
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.black,
  );

  Widget appBarTitle = Text(
    'Menu',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    init();
  }

   _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      }
      else {
        setState(() {
          _isSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  init() {
    _list.add("Google");
    _list.add("IOS");
    _list.add("Andorid");
    _list.add("Dart");
    _list.add("Flutter");
    _list.add("Python");
    _list.add("React");
    _list.add("Xamarin");
    _list.add("Kotlin");
    _list.add("Java");
    _list.add("RxAndroid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: key,
      appBar: AppBar(actions: [
        IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              _isSearching = true;
              if (actionIcon.icon == Icons.search) {
                actionIcon = Icon(
                  Icons.close,
                  color: Colors.black,
                );
                appBarTitle = TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: "Search...",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                );
              } else {
                _handleEndSearch();
              }
            });
          },
        )
      ], title: appBarTitle),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _isSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  _handleEndSearch() {
    this.actionIcon = Icon(
      Icons.search,
      color: Colors.black,
    );
    this.appBarTitle = Text(
      "Menu",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
    _isSearching = false;
     _searchQuery.clear();
  }

List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => new ChildItem(contact))
          .toList();
    }
    else {
      List<String> _searchList = [];
      for (int i = 0; i < _list.length; i++) {
        String  name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact))
          .toList();
    }
  }

  _buildList() {
    return _list.map((contact) => ChildItem(contact)).toList();
  }
}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(name));
  }
}
