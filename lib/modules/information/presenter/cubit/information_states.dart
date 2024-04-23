import 'package:equatable/equatable.dart';

abstract class InformationState extends Equatable {
  const InformationState();

  @override
  List<Object> get props => [];
}

class InformationInitialState extends InformationState {
  const InformationInitialState();
}

class InformationLoadingState extends InformationState {
  const InformationLoadingState();
}

class InformationErrorState extends InformationState {
  const InformationErrorState();
}

class InformationSuccessState extends InformationState {
  const InformationSuccessState();
}
