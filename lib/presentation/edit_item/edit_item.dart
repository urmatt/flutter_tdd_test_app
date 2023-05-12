import 'package:ex_test_app/domain/models/todo_item.dart';
import 'package:flutter/material.dart';

class EditItem extends StatefulWidget {
  const EditItem({Key? key}) : super(key: key);

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  final _titleTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              key: const Key('edit_input_title'),
              controller: _titleTextController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            TextField(
              key: const Key('edit_input_description'),
              controller: _descriptionTextController,
              decoration: const InputDecoration(hintText: 'Description'),
              minLines: 10,
              maxLines: 15,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('edit_save_fab'),
        onPressed: () => _onSave(context),
        child: const Icon(Icons.save),
      ),
    );
  }

  void _onSave(BuildContext context) {
    Navigator.pop(
      context,
      ToDoItem(
        createdAt: DateTime.now(),
        title: _titleTextController.text,
        description: _descriptionTextController.text,
      ),
    );
  }
}
