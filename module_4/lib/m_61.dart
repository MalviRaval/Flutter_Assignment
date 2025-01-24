// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class M61 extends StatefulWidget {
  const M61({Key, key}) : super(key: key);
  @override
  _M61State createState() => _M61State();
}

class _M61State extends State<M61> {
  Widget appBarTitle = Text(
    "Menu",
    style: TextStyle(color: Colors.black),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.black,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<Map> _list = [
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Vegetables And Poached Egg',
      'rate': 4,
      'like': 23,
      'price': 22.50
    },
    {
      'imageName': 'assets/images/food2.jpg',
      'foodName': 'Fried chicken',
      'rate': 4,
      'like': 23,
      'price': 22.50
    },
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Shrimp and grits',
      'rate': 4,
      'like': 23,
      'price': 22.50
    },
    {
      'imageName': 'assets/images/food2.jpg',
      'foodName': 'Banana pudding',
      'rate': 4,
      'like': 23,
      'price': 22.50
    },
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Biscuits and gravy',
      'rate': 4,
      'like': 23,
      'price': 22.50
    },
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Brunswick stew',
      'rate': 4,
      'like': 23,
      'price': 22.50
    },
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Vegetables And Poached Egg',
      'rate': 4,
      'like': 23,
      'price': 22.50
    }
  ];
  //List<String> _list = [];
  bool _isSearching = false;
  String _searchText = "";

  _M61State() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    init();
  }

  void init() {
    // _list.add("Google");
    // _list.add("IOS");
    // _list.add("Andorid");
    // _list.add("Dart");
    // _list.add("Flutter");
    // _list.add("Python");
    // _list.add("React");
    // _list.add("Xamarin");
    // _list.add("Kotlin");
    // _list.add("Java");
    // _list.add("RxAndroid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: buildBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _isSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  List<ChildItem> _buildList() {
    // return _list
    //     .map((contact) => ChildItem(
    //           name: contact,
    //         ))
    //     .toList();
    return _list
        .map(
          (foodItem) => ChildItem(name: foodItem['foodName'] as String),
        )
        .toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      // return _list
      //     .map((contact) => ChildItem(
      //           name: contact,
      //         ))
      //     .toList();
      return _list
          .map(
            (foodItem) => ChildItem(name: foodItem['foodName'] as String),
          )
          .toList();
    } else {
      List<String> searchList = [];
      for (int i = 0; i < _list.length; i++) {
        String name = _list[i]['foodName'];
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          searchList.add(name);
        }
      }
      // return searchList
      //     .map((contact) => ChildItem(
      //           name: contact,
      //         ))
      //     .toList();
      return searchList
          .map(
            (foodItem) => ChildItem(name: foodItem),
          )
          .toList();
    }
  }

  buildBar(BuildContext context) {
    return AppBar(title: appBarTitle, actions: <Widget>[
      IconButton(
        icon: actionIcon,
        onPressed: () {
          setState(() {
            if (actionIcon.icon == Icons.search) {
              actionIcon = Icon(
                Icons.close,
                color: Colors.black,
              );
              appBarTitle = TextField(
                controller: _searchQuery,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.black)),
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
      IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_outlined))
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      actionIcon = Icon(
        Icons.search,
        color: Colors.black,
      );
      appBarTitle = Text(
        "Menu",
        style: TextStyle(color: Colors.black),
      );
      _isSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final String name;
  const ChildItem({required this.name});
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(name));
  }
}
