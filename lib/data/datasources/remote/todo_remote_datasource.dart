import 'package:clean_code_architecture_flutter/common/http/http_client.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/constants/todo_remote_datasource_constants.dart';
import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';

class TodoRemoteDatasource {
  final HttpClient httpClient;
  TodoRemoteDatasource({this.httpClient});

  String baseUrl = 'https://api-nodejs-todolist.herokuapp.com/task';

  Future<void> deleteTodoById(String id) async {
    await httpClient.delete('$baseUrl/$id');
  }

  Future<void> updateTodoById(String id, dynamic data) async {
    await httpClient.put('$baseUrl/$id', data);
  }
  
  Future<Todos> getTodos() async {
    final response = await httpClient.get(TodoEndpoints.getCreateUpdateDeletePath);

    return Todos.fromJson(response);
  }
}
