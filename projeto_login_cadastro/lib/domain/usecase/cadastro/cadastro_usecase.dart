import 'package:fpdart/fpdart.dart';
import 'package:projeto_login_cadastro/data/models/cadastro_model.dart';
import 'package:projeto_login_cadastro/domain/repositories/cadastro_repository.dart';
import 'package:projeto_login_cadastro/domain/usecase/use_case.dart';

class CadastroUsecase implements UseCase<bool, RegisterModel> {
  final CadastroRepository cadastroRepository;

  CadastroUsecase(this.cadastroRepository);

  @override
  Future<Either<Exception, bool>> call({
    required RegisterModel params,
  }) async {
    return await cadastroRepository.register(params: params);
  }
}
