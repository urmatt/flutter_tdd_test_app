import 'package:ex_test_app/data/repository/todo_repository_impl.dart';
import 'package:ex_test_app/domain/repositories/todo_repository.dart';
import 'package:ex_test_app/presentation/application/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  testWidgets('Add todo item test', (WidgetTester tester) async {
    GetIt.I.registerSingleton<ToDoRepository>(ToDoRepositoryImpl());

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp(), const Duration(seconds: 2));

    expect(find.byIcon(Icons.add), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('edit_input_title')), findsOneWidget);

    const title = 'Test title';
    const description = 'Test Description';

    await tester.enterText(
        find.byKey(const Key('edit_input_title')), 'Test title');

    await tester.enterText(
        find.byKey(const Key('edit_input_description')), 'Test Description');

    await tester.tap(find.byIcon(Icons.save));
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.byKey(const Key('todos_list')), findsOneWidget);
    expect(find.widgetWithText(ListTile, title), findsOneWidget);
    expect(find.widgetWithText(ListTile, description), findsOneWidget);
  });
}
