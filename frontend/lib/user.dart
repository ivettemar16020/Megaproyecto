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

class Tokencito {
  final String token;

  Tokencito._({this.token});

  factory Tokencito.fromJson(Map<String, dynamic> json) {
    return new Tokencito._(
      token: json['token'],
    );
  }

}


class GetUser {
  final String token;

  GetUser({this.token});

  factory GetUser.fromJson(Map<String, dynamic> json) {
    return GetUser(
      token: json['token'],
    );
  }

}