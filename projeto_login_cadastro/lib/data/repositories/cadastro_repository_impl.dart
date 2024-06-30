import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:projeto_login_cadastro/data/datasources/cadastro_datasource.dart';
import 'package:projeto_login_cadastro/data/models/cadastro_model.dart';
import 'package:projeto_login_cadastro/domain/repositories/cadastro_repository.dart';

class CadastroRepositoryImpl extends CadastroRepository {
  final CadastroDatasource _remoteDataSource;

  CadastroRepositoryImpl(this._remoteDataSource, Connectivity connectivity)
      : super(connectivity);

  @override
  Future<Either<Exception, bool>> register({
    required RegisterModel params,
  }) {
    return handleRequest(
      () => _remoteDataSource.register(params: params),
    );
  }
}
