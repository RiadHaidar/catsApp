import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/breed/data/apis/breed_api_service.dart';
import '../../features/breed/data/repos/breed_repo.dart';
import '../../features/breed/presentation/logic/breed_cubit.dart';
import '../../features/images/data/apis/images_api_service.dart';
import '../../features/images/data/repos/images_repo.dart';
import '../../features/images/presentation/logic/images_cubit.dart';
import '../networking/api_constants.dart';
import '../networking/dio_factory.dart';
import '../services/authentication_service.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // ===== CORE SERVICES =====
  getIt.registerLazySingleton<AuthenticationService>(
    () => AuthenticationService(),
  );

  // ===== DIO (HTTP CLIENT) =====
  getIt.registerLazySingleton<Dio>(
    () => DioFactory.getDio(getIt<AuthenticationService>()),
  );

  // ===== BREED FEATURE =====
  getIt.registerLazySingleton<BreedApiService>(
    () => BreedApiService(
      getIt<Dio>(),
      baseUrl: ApiConstants.baseUrl,
    ),
  );

  getIt.registerLazySingleton<BreedRepo>(
    () => BreedRepo(getIt<BreedApiService>()),
  );

  getIt.registerFactory<BreedCubit>(
    () => BreedCubit(getIt<BreedRepo>()),
  );

  // ===== IMAGES FEATURE =====
  getIt.registerLazySingleton<ImagesApiService>(
    () => ImagesApiService(
      getIt<Dio>(),
      baseUrl: ApiConstants.baseUrl,
    ),
  );

  getIt.registerLazySingleton<ImagesRepo>(
    () => ImagesRepo(getIt<ImagesApiService>()),
  );

  getIt.registerFactory<ImagesCubit>(
    () => ImagesCubit(getIt<ImagesRepo>()),
  );
}
