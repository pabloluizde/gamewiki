import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginErrorState extends LoginState {
  const LoginErrorState();
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState();
}
