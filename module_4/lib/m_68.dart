import 'package:flutter/material.dart';

class M68 extends StatefulWidget {
  const M68({super.key});

  @override
  State<M68> createState() => _M68State();
}

class _M68State extends State<M68> {
  var _nameController = TextEditingController();
  var _ageController = TextEditingController();

  List<Map> data = [
    {'name': 'John', 'age': 25},
    {'name': 'Doe', 'age': 30},
    {'name': 'Smith', 'age': 35},
    {'name': 'Alex', 'age': 40}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Update'),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(data[index]['name']),
              subtitle: Text(data[index]['age'].toString()),
              onTap: () => _updateDataDialog(index),
              onLongPress: () => _deleteDataDialog(index),
            );
          },
          itemCount: data.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addDataDialog(),
      ),
    );
  }

  _updateDataDialog(int index) {
    _nameController.text = data[index]['name'];
    _ageController.text = data[index]['age'].toString();
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Edit Data'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  TextField(
                    controller: _ageController,
                    decoration: const InputDecoration(hintText: "Age"),
                  ),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    setState(() {
                      data[index]['name'] = _nameController.text.toString();
                      data[index]['age'] = _ageController.text.toString();
                    });
                    print(_nameController.text.toString());
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }

  _deleteDataDialog(int index) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Delete Data'),
              content: Text(
                'Are you sure you want to delete this ${data[index]['name']}?',
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      data.removeAt(index);
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Okay'),
                )
              ],
            ));
  }

  _addDataDialog() {
    _nameController.text = '';
    _ageController.text = '';
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Edit Data'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  TextField(
                    controller: _ageController,
                    decoration: const InputDecoration(hintText: "Age"),
                  ),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    if (_nameController.text.isNotEmpty &&
                        _ageController.text.isNotEmpty) {
                      setState(() {
                        data.add({
                          'name': _nameController.text.toString(),
                          'age': _ageController.text.toString()
                        });
                      });
                    }

                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }
}
