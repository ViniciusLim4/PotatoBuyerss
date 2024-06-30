import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/data/models/cadastro_model.dart';
import 'package:projeto_login_cadastro/domain/usecase/cadastro/cadastro_usecase.dart';
import 'package:projeto_login_cadastro/shared/error_types/exceptions.dart';
import 'package:projeto_login_cadastro/shared/response/default_response.dart';
import 'package:projeto_login_cadastro/shared/response/default_response_mapper.dart';

abstract class CadastroDatasource {
  CadastroDatasource(Dio dio);

  Future<bool> register({
    required RegisterModel params,
  });
}

class CadastroDataSourceImpl implements CadastroDatasource {
  final Dio _dio;

  CadastroDataSourceImpl(Dio dio) : _dio = dio;

  @override
  Future<bool> register({required RegisterModel params}) async {
    try {
      var data = params;

      final response = await _dio.post('', data: data);

      return _handleRegister(response);
    } on DioException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  bool _handleRegister(Response response) {
    if (response.statusCode == 200) {
      final DefaultResponseModel defaultResponse =
          DefaultResponseMapper.fromJson(response.data);
      if (!defaultResponse.isSucceed) {
        throw UnexpectedException(
            message: defaultResponse.messages.first['description']);
      } else {
        return true;
      }
    }
    if (response.statusMessage != null) {
      throw UnexpectedException(message: response.statusMessage!);
    }
    throw UnexpectedException();
  }
}
