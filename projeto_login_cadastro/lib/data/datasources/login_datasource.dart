import 'package:dio/dio.dart';
import 'package:projeto_login_cadastro/data/mappers/login/user_mapper.dart';
import 'package:projeto_login_cadastro/data/models/login_model.dart';
import 'package:projeto_login_cadastro/domain/entities/user.dart';
import 'package:projeto_login_cadastro/shared/error_types/exceptions.dart';

abstract class LoginDatasource {
  LoginDatasource(Dio dio);

  Future<User> login(LoginModel loginModel);
}

class LoginDataSourceImpl implements LoginDatasource {
  final Dio _dio;

  LoginDataSourceImpl(Dio dio) : _dio = dio;

  @override
  Future<User> login(LoginModel loginModel) async {
    final response = await _dio.post(
      'https://api.example.com/login',
      data: {
        'email': loginModel.email,
        'password': loginModel.password,
      },
    );

    if (response.statusCode == 200) {
      print(response);
      return _handleLogin(response);
    } else {
      throw Exception('Failed to login');
    }
  }

  User _handleLogin(Response response) {
    try {
      if (response.statusCode == 200 && response.data['isSucceed']) {
        return UserMapper.fromMap(response.data['data']);
      }
      if (response.statusMessage != null) {
        throw UnexpectedException(message: response.statusMessage!);
      }
      throw UnexpectedException(message: '');
    } catch (e) {
      rethrow;
    }
  }
}
