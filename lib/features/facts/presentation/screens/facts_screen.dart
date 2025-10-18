import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/facts_bloc_builder.dart';
import '../widgets/facts_bloc_listener.dart';

class FactsScreen extends StatelessWidget {
  const FactsScreen({super.key});

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
                    'Discover Cat Facts',
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
                      icon: const Icon(Icons.lightbulb_outline),
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
                'Interesting facts about different cat breeds',
                style: TextStyles.font14GreyRegular.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Facts List
            const FactsBlocListener(),
            const Expanded(child: FactsListBlocBuilder()),
          ],
        ),
      ),
    );
  }
}
