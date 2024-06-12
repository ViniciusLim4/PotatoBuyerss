import 'package:fpdart/fpdart.dart';
import 'package:projeto_login_cadastro/data/models/login_model.dart';
import 'package:projeto_login_cadastro/data/models/user_model.dart';
import 'package:projeto_login_cadastro/domain/entities/user.dart';
import 'package:projeto_login_cadastro/domain/repositories/login_repository.dart';
import 'package:projeto_login_cadastro/domain/usecase/use_case.dart';

class LoginUseCase extends UseCase<User, LoginModel> {
  final LoginRepository _loginRepository;

  LoginUseCase(
    LoginRepository loginRepository,
  ) : _loginRepository = loginRepository;

  @override
  Future<Either<Exception, User>> call({
    required LoginModel params,
  }) async {
    return await _loginRepository.login(params);
  }
}
