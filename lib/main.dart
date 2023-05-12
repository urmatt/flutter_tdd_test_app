import 'package:ex_test_app/domain/repositories/todo_repository.dart';
import 'package:ex_test_app/presentation/application/application.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'data/repository/todo_repository_impl.dart';

void main() {
  injectDependencies();
  runApp(const MyApp());
}

void injectDependencies() {
  GetIt.I.registerSingleton<ToDoRepository>(ToDoRepositoryImpl());
}
