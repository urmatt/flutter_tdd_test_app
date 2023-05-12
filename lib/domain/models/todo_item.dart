import 'package:intl/intl.dart';

class ToDoItem {
  String? title;
  String? description;
  DateTime? createdAt;

  ToDoItem({
    this.createdAt,
    this.title,
    this.description,
  });

  String get formatedDate =>
      createdAt != null ? DateFormat.Hms().format(createdAt!) : '';
}
