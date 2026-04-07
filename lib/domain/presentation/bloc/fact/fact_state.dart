class FactState {
  final String fact;

  final String errorMessage;
  FactState({required this.fact, required this.errorMessage});
}

class FactInitialState extends FactState {
  FactInitialState() : super(fact: '', errorMessage: '');
}

class FactLoadingState extends FactState {
  FactLoadingState() : super(fact: '', errorMessage: '');
}

class FactErrorState extends FactState {
  FactErrorState(String error) : super(fact: '', errorMessage: error);
}

class FactSuccessState extends FactState {
  FactSuccessState(String fact) : super(fact: fact, errorMessage: '');
}
