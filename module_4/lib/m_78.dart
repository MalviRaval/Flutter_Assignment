import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_4/bloc/m_78/name_bloc.dart';
import 'package:module_4/bloc/m_78/name_event.dart';
import 'package:module_4/bloc/m_78/name_state.dart';

class M78 extends StatelessWidget {
  M78({super.key});

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('M78'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final name = _nameController.text;
                      if (name.isNotEmpty) {
                        _nameController.clear();
                        context.read<NameBloc>().add(AddName(name));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Name $name added to list'),
                          ),
                        );
                      }
                    },
                    child: const Text('Add Name'),
                  ),
                  BlocBuilder<NameBloc, NameState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.names.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  _openDialog(
                                      context, state.names[index], index);
                                },
                                child: Dismissible(
                                  background: Container(color: Colors.red),
                                  key: Key(state.names[index]),
                                  onDismissed: (direction) {
                                    context
                                        .read<NameBloc>()
                                        .add(DeleteName(state.names[index]));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Item ${state.names[index]} dismissed")));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15.0, bottom: 15.0),
                                    child: Text(state.names[index]),
                                  ),
                                ),
                              );
                            }),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _openDialog(BuildContext context, String name, int index) {
    return showDialog(
        context: context,
        barrierColor: Colors.white.withOpacity(0.5),
        builder: (_) {
          TextEditingController nameController =
              TextEditingController(text: name);
          return AlertDialog(
            title: Text('Options'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final newName = nameController.text;
                        if (newName.isNotEmpty) {
                          context
                              .read<NameBloc>()
                              .add(UpdateName(index, newName));
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [],
          );
        });
  }
}
