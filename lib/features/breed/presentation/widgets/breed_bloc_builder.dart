import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../logic/breed_cubit.dart';
import '../logic/breed_states.dart';
import '../screens/breed_detail_screen.dart';

class BreedsListBlocBuilder extends StatelessWidget {
  const BreedsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreedCubit, BreedStates>(
      buildWhen: (previous, current) =>
          current is BreedsLoading ||
          current is BreedsSuccess ||
          current is BreedsFailure,
      builder: (context, state) {
        if (state is BreedsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.primary,
            ),
          );
        }

        if (state is BreedsSuccess) {
          final breeds = state.breeds;
          return RefreshIndicator(
            onRefresh: () async {
              context.read<BreedCubit>().getBreeds();
            },
            child: ListView.builder(
              itemCount: breeds.length,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              itemBuilder: (context, index) {
                final breed = breeds[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BreedDetailScreen(breed: breed),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
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
                    child: Row(
                      children: [
                        // Pet Image
                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            color: ColorsManager.cardBackground,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                            child: breed.image != null
                                ? Image.network(
                                    breed.image!.url,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Icon(
                                          Icons.pets,
                                          size: 50,
                                          color: ColorsManager.primary,
                                        ),
                                      );
                                    },
                                  )
                                : const Center(
                                    child: Icon(
                                      Icons.pets,
                                      size: 50,
                                      color: ColorsManager.primary,
                                    ),
                                  ),
                          ),
                        ),

                        // Pet Info
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Name
                                Text(
                                  breed.name,
                                  style: TextStyles.font20BlackMedium.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),

                                // Origin (as gender substitute)
                                Text(
                                  breed.origin ?? 'Unknown',
                                  style: TextStyles.font14GreyRegular,
                                ),
                                const SizedBox(height: 4),

                                // Life Span (as age substitute)
                                Text(
                                  '${breed.lifeSpan} years',
                                  style: TextStyles.font14GreyRegular,
                                ),
                                const SizedBox(height: 8),

                                // Temperament (first trait)
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: ColorsManager.location,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        breed.temperament?.split(',').first.trim() ?? 'Friendly',
                                        style: TextStyles.font14GreyRegular,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Heart Icon
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.favorite_border,
                            color: ColorsManager.primary,
                            size: 28,
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

        if (state is BreedsFailure) {
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
                    context.read<BreedCubit>().getBreeds();
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
