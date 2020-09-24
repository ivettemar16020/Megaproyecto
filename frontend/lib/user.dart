class User {
  final String username;
  final String email;
  final String password;

  User({this.username, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}

class Token {
  final String username;
  final String password;

  Token({this.username, this.password});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      username: json['username'],
      password: json['password'],
    );
  }

}

class GetUser {
  final String authorization;

  GetUser({this.authorization});

  factory GetUser.fromJson(Map<String, dynamic> json) {
    return GetUser(
      authorization: json['token'],
    );
  }

}