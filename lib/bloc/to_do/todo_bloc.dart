import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/to_do/todo_event.dart';
import 'package:bloc_practice/bloc/to_do/todo_states.dart';

class TodoBloc extends Bloc<TodoEvent, TodoStates>{
  final List<String> taskList=[];
  TodoBloc():super(const TodoStates()){
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<TodoStates> emit){
    taskList.add(event.task);
    emit(state.copyWith(todoList:List.from(taskList)));
  }


  void _removeTodoEvent(RemoveTodoEvent event, Emitter<TodoStates> emit){
    taskList.remove(event.task);
    emit(state.copyWith(todoList:List.from(taskList)));
  }


}