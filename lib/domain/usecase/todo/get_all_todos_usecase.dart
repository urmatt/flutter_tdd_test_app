import 'package:ex_test_app/domain/models/todo_item.dart';
import 'package:ex_test_app/domain/repositories/todo_repository.dart';
import 'package:ex_test_app/domain/usecase/usecase.dart';

class GetAllToDosUseCase extends UseCase<Null, Future<List<ToDoItem>>> {
  final ToDoRepository repository;

  GetAllToDosUseCase(this.repository);

  @override
  Future<List<ToDoItem>> execute(Null) {
    return repository.getAll();
  }
}
