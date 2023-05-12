import 'package:ex_test_app/domain/models/todo_item.dart';

abstract class ToDoRepository {
  Future<List<ToDoItem>> getAll();

  void addItem(ToDoItem item);

  void removeItem(ToDoItem item);
}
