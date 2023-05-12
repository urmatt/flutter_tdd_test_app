import 'package:ex_test_app/domain/models/todo_item.dart';
import 'package:ex_test_app/domain/repositories/todo_repository.dart';
import 'package:ex_test_app/domain/usecase/usecase.dart';

class AddToDoItemUseCase extends UseCase<ToDoItem, void> {
  final ToDoRepository repository;

  AddToDoItemUseCase(this.repository);

  @override
  void execute(ToDoItem item) {
    repository.addItem(item);
  }
}
