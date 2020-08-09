import 'dart:async';

import 'package:frontend/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<User> createUser(String username, String email, String password) async {

  final http.Response response = await http.post(
    'https://megap115.herokuapp.com/retos/user/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'password': password,
    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Error al cargar usuario');
  }
}