import 'package:fpdart/fpdart.dart';
import 'package:projeto_login_cadastro/data/models/cadastro_model.dart';
import 'package:projeto_login_cadastro/domain/repositories/login_repository.dart';
import 'package:projeto_login_cadastro/domain/usecase/cadastro/cadastro_usecase.dart';

abstract class CadastroRepository extends RepositoryTemplate {
  CadastroRepository(super.connectivity);

  Future<Either<Exception, bool>> cadastro({
    required CadastroParams params,
  });
}
