import 'package:projeto_login_cadastro/domain/entities/user.dart';

class UserMapper {
  static User fromMap(Map<String, dynamic> json) {
    return User(token: json['token']);
  }
}
