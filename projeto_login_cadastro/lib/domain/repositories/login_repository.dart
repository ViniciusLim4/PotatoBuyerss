import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:projeto_login_cadastro/data/models/login_model.dart';
import 'package:projeto_login_cadastro/domain/entities/user.dart';
import 'package:projeto_login_cadastro/shared/error_types/exceptions.dart';

abstract class LoginRepository extends RepositoryTemplate {
  LoginRepository(super.connectivity);

  Future<Either<Exception, User>> login(LoginModel loginModel);
}

abstract class RepositoryTemplate {
  final Connectivity connectivity;

  RepositoryTemplate(this.connectivity);

  Future<Either<AppException, T>> handleRequest<T>(Future<T> Function() request) async {
    try {
      var connectionResult = await connectivity.checkConnectivity();
      if (connectionResult == ConnectivityResult.none) {
        return Left(AppException('No internet connection'));
      }

      T response = await request();
      return Right(response);
    } catch (e) {
      return Left(AppException(e.toString()));
    }
  }
}


class AppException implements Exception {
  final String message;

  AppException(this.message);
}