import '../../data/models/response/fact_response.dart';

sealed class FactsStates {}

final class FactsInitial extends FactsStates {}

// GET FACTS
final class FactsLoading extends FactsStates {}

final class FactsSuccess extends FactsStates {
  final List<FactResponse> facts;
  FactsSuccess(this.facts);
}

final class FactsFailure extends FactsStates {
  final String message;
  FactsFailure(this.message);
}

// GET BREED FACTS
final class BreedFactsLoading extends FactsStates {}

final class BreedFactsSuccess extends FactsStates {
  final List<FactResponse> facts;
  BreedFactsSuccess(this.facts);
}

final class BreedFactsFailure extends FactsStates {
  final String message;
  BreedFactsFailure(this.message);
}
