import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/response/breed_response.dart';

class BreedDetailScreen extends StatelessWidget {
  final BreedResponse breed;

  const BreedDetailScreen({
    super.key,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.cardBackground,
      body: Column(
        children: [
          // Hero Image Section
          Stack(
            children: [
              // Image
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManager.cardBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: breed.image != null
                    ? ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.network(
                          breed.image!.url,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(
                                Icons.pets,
                                size: 100,
                                color: ColorsManager.primary,
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Icon(
                          Icons.pets,
                          size: 100,
                          color: ColorsManager.primary,
                        ),
                      ),
              ),

              // Back Button
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsManager.white.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsManager.primary,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: ColorsManager.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Content Section
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            breed.name,
                            style: TextStyles.font24BlackSemiBold.copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Text(
                          '\$95', // Placeholder price
                          style: TextStyles.font24BlackSemiBold.copyWith(
                            fontSize: 28,
                            color: ColorsManager.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Location
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 20,
                          color: ColorsManager.location,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          breed.origin ?? 'Unknown location',
                          style: TextStyles.font16BlackRegular.copyWith(
                            color: ColorsManager.textSecondary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Info Cards
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            'Gender',
                            'Male', // Placeholder
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildInfoCard(
                            'Age',
                            breed.lifeSpan,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildInfoCard(
                            'Weight',
                            '${breed.weight.metric} kg',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // About Section
                    Text(
                      'About:',
                      style: TextStyles.font20BlackMedium.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      breed.description,
                      style: TextStyles.font16BlackRegular.copyWith(
                        color: ColorsManager.textSecondary,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Temperament
                    if (breed.temperament != null) ...[
                      Text(
                        breed.temperament!,
                        style: TextStyles.font16BlackRegular.copyWith(
                          color: ColorsManager.textSecondary,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Adopt Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Adopting ${breed.name}...'),
                              backgroundColor: ColorsManager.primary,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.primary,
                          foregroundColor: ColorsManager.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Adopt me',
                          style: TextStyles.font16BlackMedium.copyWith(
                            fontSize: 18,
                            color: ColorsManager.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: ColorsManager.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyles.font14GreyRegular.copyWith(
              color: ColorsManager.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyles.font16BlackMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
