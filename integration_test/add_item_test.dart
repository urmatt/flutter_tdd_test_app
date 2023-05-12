
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ex_test_app/main.dart' as app;

void main () {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End to end test', () {
    testWidgets('Add item verify count', (tester) async {
      app.main();

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('todos_list')), findsOneWidget);

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
  });
}