import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/cadastro_state/cadastro_state.dart';

class CadastroBloc extends Cubit<CadastroState> {
  CadastroBloc() : super(CadastroInitState());
}
