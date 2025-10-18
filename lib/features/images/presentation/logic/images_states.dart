import '../../data/models/response/cat_image_response.dart';

sealed class ImagesStates {}

final class ImagesInitial extends ImagesStates {}

// SEARCH IMAGES
final class ImagesLoading extends ImagesStates {}

final class ImagesSuccess extends ImagesStates {
  final List<CatImageResponse> images;
  ImagesSuccess(this.images);
}

final class ImagesFailure extends ImagesStates {
  final String message;
  ImagesFailure(this.message);
}
