import 'package:flutter/material.dart';

import '../../../../common/injector/injector.dart';
import '../../../../domain/entities/todo_entity.dart';
import '../bloc/todo_bloc.dart';

class CreateTodoScreen extends StatefulWidget {
  CreateTodoScreen({
    Key key,
  }) : super(key: key);

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  TextEditingController _descriptionController = TextEditingController();
  TodoBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = Injector.resolve<TodoBloc>();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) => Scaffold(
        appBar: AppBar(
          title: Text('Create Todo'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final TodoEntity todo = TodoEntity(
                    description: _descriptionController.text,
                  );
                },
                child: const Text('Create'),
              )
            ],
          ),
        ),
      );
}
