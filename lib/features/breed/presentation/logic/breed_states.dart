import '../../data/models/response/breed_response.dart';

sealed class BreedStates {}

final class BreedInitial extends BreedStates {}

// GET BREEDS
final class BreedsLoading extends BreedStates {}

final class BreedsSuccess extends BreedStates {
  final List<BreedResponse> breeds;
  BreedsSuccess(this.breeds);
}

final class BreedsFailure extends BreedStates {
  final String message;
  BreedsFailure(this.message);
}

// GET BREED BY ID
final class BreedDetailLoading extends BreedStates {}

final class BreedDetailSuccess extends BreedStates {
  final BreedResponse breed;
  BreedDetailSuccess(this.breed);
}

final class BreedDetailFailure extends BreedStates {
  final String message;
  BreedDetailFailure(this.message);
}
