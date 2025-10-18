import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/images_bloc_builder.dart';
import '../widgets/images_bloc_listener.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

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
                    'Discover Cat Images',
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
                      icon: const Icon(Icons.photo_library_outlined),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Beautiful cat photos from around the world',
                style: TextStyles.font14GreyRegular.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Images Grid
            const ImagesBlocListener(),
            const Expanded(child: ImagesGridBlocBuilder()),
          ],
        ),
      ),
    );
  }
}
