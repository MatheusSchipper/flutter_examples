import 'dart:convert';
import 'dart:io';

import 'package:examples/features/todo_list/presentation/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List _todoList = [];
  Map<String, dynamic> _lastRemoved;
  int _lastIndexRemoved;
  final TextEditingController todoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _readData().then(
      (value) {
        setState(
          () {
            _todoList = jsonDecode(value);
          },
        );
      },
    );
  }

  void _addToDo() {
    if (todoController.text.isEmpty) return;
    setState(() {
      Map<String, dynamic> newTodo = Map();
      newTodo["title"] = todoController.text;
      todoController.text = "";
      newTodo["ok"] = false;
      _todoList.add(newTodo);
      _saveData();
    });
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(
      () {
        _todoList.sort(
          (a, b) {
            if (a["ok"] && !b["ok"])
              return 1;
            else if (!a["ok"] && b["ok"])
              return -1;
            else
              return 0;
          },
        );
        _saveData();
      },
    );
    return null;
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = jsonEncode(_todoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(17, 1, 17, 1),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                      labelText: "Nova tarefa",
                      enabledBorder: Theme.of(context)
                          .inputDecorationTheme
                          .enabledBorder
                          .copyWith(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                      focusedBorder: Theme.of(context)
                          .inputDecorationTheme
                          .focusedBorder
                          .copyWith(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                      labelStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("Add"),
                    textColor: Colors.white,
                    onPressed: _addToDo,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  var item = _todoList[index];
                  return ItemWidget(
                    context: context,
                    item: item,
                    onChanged: (checked) {
                      setState(
                        () {
                          item["ok"] = checked;
                          _saveData();
                        },
                      );
                    },
                    onDismissed: (direction) {
                      setState(
                        () {
                          _lastRemoved = Map.from(item);
                          _lastIndexRemoved = index;
                          _todoList.removeAt(index);
                          _saveData();
                          final snack = SnackBar(
                            content: Text(
                                "Tarefa \"${_lastRemoved["title"]}\" removida"),
                            action: SnackBarAction(
                              label: "Desfazer",
                              onPressed: () {
                                setState(() {
                                  _todoList.insert(
                                      _lastIndexRemoved, _lastRemoved);
                                  _saveData();
                                });
                              },
                            ),
                            duration: Duration(seconds: 4),
                          );
                          Scaffold.of(context).removeCurrentSnackBar();
                          Scaffold.of(context).showSnackBar(snack);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
