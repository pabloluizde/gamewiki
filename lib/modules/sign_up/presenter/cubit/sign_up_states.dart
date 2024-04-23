import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitialState extends SignUpState {
  const SignUpInitialState();
}

class SignUpLoadingState extends SignUpState {
  const SignUpLoadingState();
}

class SignUpErrorState extends SignUpState {
  const SignUpErrorState();
}

class SignUpSuccessState extends SignUpState {
  const SignUpSuccessState();
}
