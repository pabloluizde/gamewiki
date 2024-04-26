import 'package:equatable/equatable.dart';

abstract class GameLibraryState extends Equatable {
  const GameLibraryState();

  @override
  List<Object> get props => [];
}

class GameLibraryInitialState extends GameLibraryState {
  const GameLibraryInitialState();
}

class GameLibraryLoadingState extends GameLibraryState {
  const GameLibraryLoadingState();
}

class GameLibraryErrorState extends GameLibraryState {
  const GameLibraryErrorState();
}

class GameLibrarySuccessState extends GameLibraryState {
  const GameLibrarySuccessState();
}
