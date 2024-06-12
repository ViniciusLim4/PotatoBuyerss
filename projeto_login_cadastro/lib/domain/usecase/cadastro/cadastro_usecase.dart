import 'package:fpdart/fpdart.dart';
import 'package:projeto_login_cadastro/domain/repositories/cadastro_repository.dart';
import 'package:projeto_login_cadastro/domain/usecase/use_case.dart';

class CadastroUsecase implements UseCase<bool, CadastroParams> {
  final CadastroRepository cadastroRepository;

  CadastroUsecase(this.cadastroRepository);

  @override
  Future<Either<Exception, bool>> call({
    required CadastroParams params,
  }) async {
    return await cadastroRepository.cadastro(
      params: params,
    );
  }
}

class CadastroParams {
  final String? cpf;
  final String? nome;
  final String? email;
  final String? telefone;
  final String? senha;

  CadastroParams({
    required this.cpf,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.senha
  });
}