import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {
  const SearchInitialState();
}

class SearchLoadingState extends SearchState {
  const SearchLoadingState();
}

class SearchErrorState extends SearchState {
  const SearchErrorState();
}

class SearchSuccessState extends SearchState {
  const SearchSuccessState();
}
