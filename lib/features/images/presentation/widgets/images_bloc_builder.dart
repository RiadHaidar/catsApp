import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../breed/presentation/screens/breed_detail_screen.dart';
import '../logic/images_cubit.dart';
import '../logic/images_states.dart';

class ImagesGridBlocBuilder extends StatelessWidget {
  const ImagesGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesCubit, ImagesStates>(
      buildWhen: (previous, current) =>
          current is ImagesLoading ||
          current is ImagesSuccess ||
          current is ImagesFailure,
      builder: (context, state) {
        if (state is ImagesLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.primary,
            ),
          );
        }

        if (state is ImagesSuccess) {
          final images = state.images;
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ImagesCubit>().loadImages();
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              itemCount: images.length,
              itemBuilder: (context, index) {
                final image = images[index];
                final breed = image.breeds?.isNotEmpty == true
                    ? image.breeds!.first
                    : null;

                return GestureDetector(
                  onTap: () {
                    if (breed != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BreedDetailScreen(breed: breed),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsManager.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorsManager.cardBackground,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    image.url,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return const Center(
                                        child: Icon(
                                          Icons.pets,
                                          size: 40,
                                          color: ColorsManager.primary,
                                        ),
                                      );
                                    },
                                  ),
                                  // Heart icon overlay
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: ColorsManager.white
                                            .withValues(alpha: 0.9),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: ColorsManager.primary,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Breed info
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (breed != null) ...[
                                Text(
                                  breed.name,
                                  style:
                                      TextStyles.font16BlackMedium.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  breed.origin ?? 'Unknown',
                                  style: TextStyles.font14GreyRegular,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ] else ...[
                                Text(
                                  'Adorable Cat',
                                  style:
                                      TextStyles.font16BlackMedium.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Tap to view',
                                  style: TextStyles.font14GreyRegular,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        if (state is ImagesFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: ColorsManager.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error: ${state.message}',
                  style: TextStyles.font16BlackRegular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<ImagesCubit>().loadImages();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
