// prefer__literals_to_create_immutables

// ignore_for_file: prefer__literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:module_4/drawer/all_inbox.dart';

class CommonDrawer extends StatelessWidget {
  final List<Map> _itemListDrawer = [
    {'name': 'All inboxes', 'icon': Icons.inbox},
    {'name': 'Primary', 'icon': Icons.inbox},
    {'name': 'Social', 'icon': Icons.inbox},
    {'name': 'Promotions', 'icon': Icons.inbox},
    {'name': 'Starred', 'icon': Icons.inbox},
    {'name': 'Snoozed', 'icon': Icons.inbox},
    {'name': 'Important', 'icon': Icons.inbox},
    {'name': 'Sent', 'icon': Icons.inbox},
    {'name': 'Scheduled', 'icon': Icons.inbox},
    {'name': 'Outbox', 'icon': Icons.inbox},
    {'name': 'Drafts', 'icon': Icons.inbox},
    {'name': 'All mail', 'icon': Icons.inbox},
    {'name': 'Spam', 'icon': Icons.inbox},
    {'name': 'Bin', 'icon': Icons.inbox},
    {'name': 'Categories', 'icon': Icons.inbox},
    {'name': 'Create new label', 'icon': Icons.inbox},
    {'name': 'More', 'icon': Icons.inbox}
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                child: Image.asset(
                  'assets/images/bg.jpg',
                  fit: BoxFit.fill,
                  height: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/avt.jpg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Malvi Raval',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text(
                      'malviraval18@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey[200],
          ),
          ListView.separated(
            itemCount: _itemListDrawer.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ListTile(
              leading: Icon(_itemListDrawer[index]['icon']),
              title: Text(_itemListDrawer[index]['name']),
              onTap: () {
                Navigator.pop(context);

                if (index == 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AllInbox()),
                  );
                } else if (index == 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AllInbox()),
                  );
                }
              },
            ),
            separatorBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Divider();
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}

PreferredSizeWidget buildAppBar(BuildContext context,
    {String title = 'Mails'}) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
         
        },
      ),
      IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () {
          
        },
      ),
    ],
  );
}

class M69 extends StatefulWidget {
  M69({super.key});

  @override
  State<M69> createState() => _M69State();
}

class _M69State extends State<M69> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, title: 'Mails'), drawer: CommonDrawer());
  }

  drawerMenu() {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.inbox,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'All inboxes',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            height: 1,
            color: Colors.grey[300],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
