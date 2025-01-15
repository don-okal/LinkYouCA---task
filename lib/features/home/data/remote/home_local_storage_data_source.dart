import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/todo_model.dart';

class LocalStorageService {
  static const String _keyTodos = 'todos';

  Future<void> saveTodos(ToDoModel toDoModel) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(toDoModel.toJson());
    await prefs.setString(_keyTodos, jsonString);
  }

  Future<ToDoModel?> getTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyTodos);
    if (jsonString != null) {
      return ToDoModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}
