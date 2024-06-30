import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_login_cadastro/data/models/cadastro_model.dart';
import 'package:projeto_login_cadastro/domain/usecase/cadastro/cadastro_usecase.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/cadastro_state/cadastro_state.dart';

class CadastroBloc extends Cubit<CadastroState> {
  final CadastroUsecase cadastroUsecase;

  CadastroBloc({
   required this.cadastroUsecase,
  }) : super(CadastroInitState());

  Future<void> register({required RegisterModel registerModel}) async {
    return await _onRegister(params: registerModel);
  }

  Future<void> _onRegister({required RegisterModel params}) async {
    emit(CadastroLoadingState());

    var result = await cadastroUsecase(params: params);
    
    result.fold((error) {
      emit(CadastroErrorState());
    }, (success) {
      emit(CadastroSuccessState());
    });
  }
}
