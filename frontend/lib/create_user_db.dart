import 'dart:async';

import 'package:frontend/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<User> createUser(String username, String email, String password) async {
  final Map<dynamic, dynamic> userParams = {
    'username': username,
    'email': email,
    'password': password,
  };

  final http.Response response = await http.post(
    'https://megap115.herokuapp.com/retos/user/',
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: userParams,
  );
  if (response.statusCode == 500 || response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    response.body;
    //print(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Error al crear el usuario');
  }
}

Future<Token> getToken(String username, String password) async {
  final Map<dynamic, dynamic> tokenParams = {
    'username': username,
    'password': password,
  };

  final http.Response response = await http.post(
    'https://megap115.herokuapp.com/retos-token-auth/',
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: tokenParams,
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    response.body;
    print(json.decode(response.body));
    //print(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Error al obtener el usuario');
  }
}
