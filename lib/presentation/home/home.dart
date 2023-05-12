import 'package:ex_test_app/domain/models/todo_item.dart';
import 'package:ex_test_app/domain/repositories/todo_repository.dart';
import 'package:ex_test_app/presentation/edit_item/edit_item.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ToDoRepository _repository;

  List<ToDoItem> _todos = [];

  @override
  void initState() {
    _repository = GetIt.instance.get<ToDoRepository>();
    super.initState();
  }

  void _addNewToDoItem(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return const EditItem();
    })).then((item) {
      if (item is ToDoItem) {
        _repository.addItem(item);
        _repository.getAll().then((value) {
          setState(() {
            _todos = value;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        key: const Key('todos_list'),
        itemBuilder: _itemBuilder,
        itemCount: _todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('add_fab'),
        onPressed: () => _addNewToDoItem(context),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final item = _todos[index];
    return ListTile(
      title: Text(item.title ?? ''),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => onDelete(item),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.description ?? ''),
          Text(item.formatedDate),
        ],
      ),
    );
  }

  void onDelete(ToDoItem item) {
    _repository.removeItem(item);
    setState(() {});
  }
}
