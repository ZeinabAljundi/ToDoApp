import 'package:ayah2/models/todo_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ToDoCubit extends Cubit<List<Todo>> {
  ToDoCubit() : super([]);


  void addTask(String title) {
    final newTask = Todo(title: title, isDone: false);
    emit([...state, newTask]);
  }

  void deleteTask(int index) {
    final List<Todo> updatedTasks = List.from(state)..removeAt(index);
    emit(updatedTasks);
  }


  void toggleTaskStatus(int index, bool isDone) {
    List<Todo> updatedTasks = List.from(state);
    updatedTasks[index] = Todo(
      title: updatedTasks[index].title,
      isDone: !isDone,
    );
    emit(updatedTasks);
  }
}
