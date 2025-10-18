import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/images_repo.dart';
import 'images_states.dart';

class ImagesCubit extends Cubit<ImagesStates> {
  final ImagesRepo _repo;

  ImagesCubit(this._repo) : super(ImagesInitial()) {
    loadImages();
  }

  void loadImages({int? limit, int? page, String? order}) async {
    emit(ImagesLoading());
    final result = await _repo.searchImages(
      limit: limit,
      page: page,
      order: order,
      hasBreeds: true,
    );
    result.when(
      success: (data) => emit(ImagesSuccess(data)),
      failure: (error) => emit(ImagesFailure(error)),
    );
  }
}
