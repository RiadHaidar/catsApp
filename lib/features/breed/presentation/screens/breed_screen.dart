import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/breed_bloc_builder.dart';
import '../widgets/breed_bloc_listener.dart';

class BreedScreen extends StatelessWidget {
  const BreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find Your Forever Pet',
                    style: TextStyles.font24BlackSemiBold.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsManager.lightGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.notifications_outlined),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.searchBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyles.font16BlackRegular.copyWith(
                      color: ColorsManager.textHint,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: ColorsManager.grey,
                    ),
                    suffixIcon: const Icon(
                      Icons.tune,
                      color: ColorsManager.grey,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Categories Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Categories',
                style: TextStyles.font24BlackSemiBold,
              ),
            ),

            const SizedBox(height: 12),

            // Category Pills
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildCategoryChip('All', isSelected: true),
                  _buildCategoryChip('Cats'),
                  _buildCategoryChip('Dogs'),
                  _buildCategoryChip('Birds'),
                  _buildCategoryChip('Fish'),
                  _buildCategoryChip('Reptiles'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Breed List
            const BreedBlocListener(),
            const Expanded(child: BreedsListBlocBuilder()),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? ColorsManager.white : ColorsManager.grey,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        backgroundColor: isSelected
            ? ColorsManager.primary
            : ColorsManager.cardBackground,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
