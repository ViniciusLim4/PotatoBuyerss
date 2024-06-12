abstract class LoginState {
  LoginState._();

  T when<T>({
    required T Function() loading,
    required T Function() error,
    required T Function() init,
    required T Function(LoginSuccessState success) success,
  }) {
    return switch (this) {
      LoginInicialState() => init(),
      LoginLoadingState() => loading(),
      LoginSuccessState s => success(s),
      LoginErrorState() => error(),
      _ => throw StateError('Unexpected state: $this'),
    };
  }

  T whenSuccessOrElse<T>({
    required T Function(LoginSuccessState success) success,
    required T Function(LoginState) orElse,
  }) {
    return switch (this) {
      LoginSuccessState s => success(s),
      _ => orElse(this),
    };
  }

  T? resolveWithOrNull<T extends LoginState>() {
    if (this is T) {
      return this as T;
    }
    return null;
  }
}

class LoginInicialState extends LoginState {
  LoginInicialState() : super._();
}

class LoginLoadingState extends LoginState {
  LoginLoadingState() : super._();
}

class LoginErrorState extends LoginState {
  LoginErrorState() : super._();
}

final class LoginSuccessState extends LoginState {
  final bool? isLoading;

  LoginSuccessState({
    this.isLoading,
  }) : super._();

  LoginSuccessState copyWith({
    bool? isLoading,
  }) {
    return LoginSuccessState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
