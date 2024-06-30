import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:projeto_login_cadastro/data/datasources/login_datasource.dart';
import 'package:projeto_login_cadastro/data/models/login_model.dart';
import 'package:projeto_login_cadastro/domain/entities/user.dart';
import 'package:projeto_login_cadastro/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDatasource _remoteDataSource;

  LoginRepositoryImpl(this._remoteDataSource, Connectivity connectivity) : super(connectivity);

  @override
  Future<Either<Exception, User>> login(LoginModel loginModel) {
    return handleRequest(
      () => _remoteDataSource.login(loginModel),
    );
  }
}
