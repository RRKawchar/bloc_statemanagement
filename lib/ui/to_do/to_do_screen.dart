import 'package:bloc_practice/bloc/to_do/todo_bloc.dart';
import 'package:bloc_practice/bloc/to_do/todo_event.dart';
import 'package:bloc_practice/bloc/to_do/todo_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do"),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoStates>(
        builder: (context, state) {

          if(state.todoList.isEmpty){
            return const Center(child: Text("Todo Not Found!"));
          }else if(state.todoList.isNotEmpty){
            return ListView.builder(
                itemCount: state.todoList.length,

                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index].toString(),),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(RemoveTodoEvent(task: state.todoList[index].toString()));
                      },
                      icon: const Icon(Icons.delete),
                    ),

                  );
                });


          }else{
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for(int i=0; i<10; i++){
            context.read<TodoBloc>().add(AddTodoEvent(task: 'task $i'));

          }
        }, child: const Icon(Icons.add),),
    );
  }
}
