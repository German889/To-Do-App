import 'dart:io';
import 'package:cli/models/task.dart';
import 'package:cli/utils/date_utils.dart';

final taskList = <Task>[];

void main(){
  bool isRunning = true;

  while (isRunning){
    print('\nTo-Do List:');
    print('1. Add Task');
    print('2. List Tasks');
    print('3. Exit');

    stdout.write('Enter your choice (1/2/3): ');
    final choice = stdin.readLineSync();

    switch (choice){
      case '3':
        isRunning = false;
        print('Goodbye!');
        break;
      case '2':
        _listTasks();
        break;
      case '1':
        _addTask();
        break;
      default:
        print('Invalid choice. Please try again.');
        break;
    }
  }
}

void _addTask(){
  stdout.write('Enter task title: ');
  final title = stdin.readLineSync();
  final newTask = Task.withCurrentDate(title ?? '');
  taskList.add(newTask);
  print('task added successfully!');
}
void _listTasks(){
  if (taskList.isEmpty){
    print("no tasks found.");
  }else{
    print('\nTasks:');
    for (final task in taskList){
      print("Title: ${task.title}");
      print("Due Date: ${formatDate(task.dueDate)}");
      print("Status: ${task.isDone ? 'Done' : 'Not done'}");
    }
  }
}