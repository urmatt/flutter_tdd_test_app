import 'package:ex_test_app/domain/models/todo_item.dart';
import 'package:ex_test_app/domain/repositories/todo_repository.dart';

class ToDoRepositoryImpl extends ToDoRepository{
  List<ToDoItem> _list = [];
  @override
  void addItem(ToDoItem item) {
    _list.add(item);
  }

  @override
  Future<List<ToDoItem>> getAll() async {
    return _list;
  }

  @override
  void removeItem(ToDoItem item) {
    _list.remove(item);
  }

}