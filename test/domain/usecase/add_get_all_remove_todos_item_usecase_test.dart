import 'package:ex_test_app/data/repository/todo_repository_impl.dart';
import 'package:ex_test_app/domain/models/todo_item.dart';
import 'package:ex_test_app/domain/usecase/todo/add_todo_item_usecase.dart';
import 'package:ex_test_app/domain/usecase/todo/get_all_todos_usecase.dart';
import 'package:ex_test_app/domain/usecase/todo/remove_todo_item_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = ToDoRepositoryImpl();
  final addUseCase = AddToDoItemUseCase(repository);
  final getAllUseCase = GetAllToDosUseCase(repository);
  final removeUseCase = RemoveToDoItemUseCase(repository);

  final todoItem = ToDoItem(
    createdAt: DateTime.now(),
    title: 'test',
    description: 'testd',
  );

  test('Add item usecase test', () async {
    addUseCase.execute(todoItem);
    expect(1, (await repository.getAll()).length);
  });

  test('get all usecase test', () async {
    final allToDos = await getAllUseCase.execute(null);
    expect(1, allToDos.length);
  });

  test('Remove item usecase test', () async {
    removeUseCase.execute(todoItem);
    expect(0, (await repository.getAll()).length);
  });
}
