// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:ffi';

import 'package:flutter/material.dart';

import 'utils/ratingbar.dart';

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
  final List<Map> _list = [
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Vegetables And Poached Eggharfhjhfjhsjdfhjdhfhsdfhshdfhsdh',
      'rate': 5,
      'like': 23,
      'price': 22.50,
      'category': 'Breakfast'
    },
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Vegetables And Poached Egg',
      'rate': 5,
      'like': 23,
      'price': 22.50,
      'category': 'Breakfast'
    },
    {
      'imageName': 'assets/images/food2.jpg',
      'foodName': 'Fried chicken',
      'rate': 4,
      'like': 23,
      'price': 22.50,
      'category': 'Lunch'
    },
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Shrimp and grits',
      'rate': 4,
      'like': 23,
      'price': 22.50,
      'category': 'Dinner'
    },
    {
      'imageName': 'assets/images/food2.jpg',
      'foodName': 'Banana pudding',
      'rate': 4,
      'like': 23,
      'price': 22.50,
      'category': 'Lunch'
    },
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Biscuits and gravy',
      'rate': 4,
      'like': 23,
      'category': 'Breakfast'
    },
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Brunswick stew',
      'rate': 4,
      'like': 23,
      'price': 22.50,
      'category': 'Brunch'
    },
    {
      'imageName': 'assets/images/food1.jpg',
      'foodName': 'Vegetables And Poached Egg',
      'rate': 4,
      'like': 23,
      'price': 22.50,
      'category': 'Brunch'
    }
  ];

  final List<String> _listCategory = [
    'All',
    'Breakfast',
    'Lunch',
    'Dinner',
    'Brunch'
  ];
  bool _isSearching = false;
  String _searchText = "";
  List<Map> searchList = [];

  bool _isCategoryClick = false;
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

  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: buildBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          __horizontalScoll(),
          _isSearching
              ? _buildSearchList()
              : _isCategoryClick
                  ? _buildSearchList()
                  : _buildList(_list)
        ],
      ),
    );
  }

  __horizontalScoll() {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 22.0, right: 22.0),
      child: ListView.builder(
        itemCount: _listCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              searchList = [];
              _isSearching = false;
              _handleSearchEnd();
              setState(() {
                if (_listCategory[index] == 'All') {
                  _isCategoryClick = false;
                } else {
                  _isCategoryClick = true;

                  for (int i = 0; i < _list.length; i++) {
                    if (_listCategory[index] == _list[i]['category']) {
                      searchList.add(_list[i]);
                    }
                  }
                }
              });
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    _listCategory[index],
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildList(List<Map> list) {
    return Expanded(
      child: GridView.builder(
          itemCount: list.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 20,
                  margin: EdgeInsets.all(5),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          15) // Adjust the radius as needed
                      ),
                  child: Image.asset(
                    "${list[index]['imageName']}",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
            //   return Container(
            //       margin: EdgeInsets.all(5),
            //       decoration: BoxDecoration(
            //           boxShadow: [
            //             BoxShadow(
            //                 color: Colors.white.withOpacity(0.8),
            //                 blurRadius: 5.0,
            //                 offset: Offset(0.0, 3.0)),
            //           ],
            //           border: Border.all(color: Colors.white),
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(12),
            //           )),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Image.asset(
            //             "${list[index]['imageName']}",
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 2.0, right: 2.0),
            //             child: Text(
            //               "${list[index]['foodName']}",
            //               maxLines: 2,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 5,
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 2.0, right: 2.0),
            //             child: StarRating(
            //               rating: double.parse("${list[index]['rate']}"),
            //               color: Colors.amber,
            //             ),
            //           )
            //         ],
            //       ));
            // },
          }),
    );
  }

  _buildSearchList() {
    if (_isCategoryClick == true) {
      return _buildList(searchList);
    } else if (_searchText.isEmpty) {
      return _buildList(_list);
    } else {
      searchList = [];
      for (int i = 0; i < _list.length; i++) {
        String name = _list[i]['foodName'];
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          searchList.add(_list[i]);
        }
      }
      return _buildList(searchList);
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
      _isCategoryClick = false;
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
      _isCategoryClick = false;
      _searchQuery.clear();
    });
  }
}
