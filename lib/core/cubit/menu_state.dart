import 'package:equatable/equatable.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitialState extends MenuState {
  const MenuInitialState();
}

class MenuLoadingState extends MenuState {
  const MenuLoadingState();
}

class MenuErrorState extends MenuState {
  const MenuErrorState();
}

class MenuSuccessState extends MenuState {
  const MenuSuccessState();
}
