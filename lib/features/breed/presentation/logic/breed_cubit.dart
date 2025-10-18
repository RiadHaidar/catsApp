import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/breed_repo.dart';
import 'breed_states.dart';

class BreedCubit extends Cubit<BreedStates> {
  final BreedRepo _repo;

  BreedCubit(this._repo) : super(BreedInitial()) {
    getBreeds();
  }

  void getBreeds() async {
    emit(BreedsLoading());
    final result = await _repo.getBreeds();
    result.when(
      success: (data) => emit(BreedsSuccess(data)),
      failure: (error) => emit(BreedsFailure(error)),
    );
  }

  Future<void> getBreedById(String id) async {
    emit(BreedDetailLoading());
    final result = await _repo.getBreedById(id);
    result.when(
      success: (data) => emit(BreedDetailSuccess(data)),
      failure: (error) => emit(BreedDetailFailure(error)),
    );
  }
}
