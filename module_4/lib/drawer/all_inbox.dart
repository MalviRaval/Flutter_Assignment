import 'package:flutter/material.dart';
import 'package:module_4/m_69.dart';

class AllInbox extends StatefulWidget {
  const AllInbox({super.key});

  @override
  State<AllInbox> createState() => _AllInboxState();
}

class _AllInboxState extends State<AllInbox> {
  final List<Map> _listOfData = [
    {
      'title': 'Google',
      'description': 'Security Alert',
      'time': '10:00 AM',
      'icon': 'Icons.inbox'
    },
    {
      'title': 'Facebook',
      'description': 'Security Alert',
      'time': '10:00 AM',
      'icon': 'Icons.inbox'
    },
    {
      'title': 'Twitter',
      'description': 'Security',
      'time': '10:00 AM',
      'icon': 'Icons.inbox'
    },
    {
      'title': '(Wellfound) formerly AngelList Talent',
      'description':
          'A Job you love is waiting. Complete your profile to apply.',
      'time': '10:00 AM',
      'icon': 'Icons.inbox'
    },
    {
      'title': 'HDFC Bank InstaAlerts',
      'description': 'You have done a UPI txn. Check details!',
      'time': '10:00 AM',
      'icon': 'Icons.inbox'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'All inboxes'),
      drawer: CommonDrawer(),
      body: ListView.builder(
        itemCount: _listOfData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.inbox),
            title: Text('${_listOfData[index]['title']}'),
            subtitle: Text('${_listOfData[index]['description']}'),
            trailing: Text('${_listOfData[index]['time']}'),
          );
        },
      ),
    );
  }
}
