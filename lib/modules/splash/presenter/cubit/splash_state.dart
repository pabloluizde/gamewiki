import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class InitialSplashState extends SplashState {
  const InitialSplashState();
}

class LoadingSplashState extends SplashState {
  const LoadingSplashState();
}

class ErrorSplashState extends SplashState {
  const ErrorSplashState();
}

class SuccessSplashState extends SplashState {
  const SuccessSplashState();
}
