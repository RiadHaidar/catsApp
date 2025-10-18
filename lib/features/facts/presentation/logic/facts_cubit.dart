import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/response/fact_response.dart';
import '../../data/repos/facts_repo.dart';
import 'facts_states.dart';

class FactsCubit extends Cubit<FactsStates> {
  final FactsRepo _repo;

  // Popular breed IDs to fetch facts from
  final List<String> _popularBreedIds = [
    'ragd', // Ragdoll
    'abys', // Abyssinian
    'sphy', // Sphynx
    'beng', // Bengal
    'pers', // Persian
    'mcoo', // Maine Coon
    'siam', // Siamese
  ];

  FactsCubit(this._repo) : super(FactsInitial()) {
    loadFactsFromBreeds();
  }

  // Load facts from multiple breeds
  Future<void> loadFactsFromBreeds() async {
    emit(FactsLoading());

    try {
      final allFacts = <FactResponse>[];

      // Fetch facts from multiple breeds
      for (final breedId in _popularBreedIds) {
        final result = await _repo.getBreedFacts(
          breedId: breedId,
          limit: 5, // Get 5 facts per breed
        );

        result.when(
          success: (facts) {
            if (facts.isNotEmpty) {
              allFacts.addAll(facts);
            }
          },
          failure: (_) {
            // Continue even if one breed fails
          },
        );
      }

      if (allFacts.isNotEmpty) {
        emit(FactsSuccess(allFacts));
      } else {
        emit(FactsFailure('No facts available'));
      }
    } catch (e) {
      emit(FactsFailure(e.toString()));
    }
  }

  Future<void> getBreedFacts({
    required String breedId,
    int? limit,
    int? page,
    String? order,
  }) async {
    emit(BreedFactsLoading());
    final result = await _repo.getBreedFacts(
      breedId: breedId,
      limit: limit,
      page: page,
      order: order,
    );
    result.when(
      success: (data) => emit(BreedFactsSuccess(data)),
      failure: (error) => emit(BreedFactsFailure(error)),
    );
  }
}
