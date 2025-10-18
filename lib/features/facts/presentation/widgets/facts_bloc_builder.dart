import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../logic/facts_cubit.dart';
import '../logic/facts_states.dart';

class FactsListBlocBuilder extends StatelessWidget {
  const FactsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactsCubit, FactsStates>(
      buildWhen: (previous, current) =>
          current is FactsLoading ||
          current is FactsSuccess ||
          current is FactsFailure,
      builder: (context, state) {
        if (state is FactsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.primary,
            ),
          );
        }

        if (state is FactsSuccess) {
          final facts = state.facts;
          return RefreshIndicator(
            onRefresh: () async {
              context.read<FactsCubit>().loadFactsFromBreeds();
            },
            child: ListView.builder(
              itemCount: facts.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final fact = facts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: ColorsManager.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyles.font16BlackMedium.copyWith(
                                color: ColorsManager.primary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (fact.title != null)
                                Text(
                                  fact.title!,
                                  style: TextStyles.font14GreyRegular.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              if (fact.title != null) const SizedBox(height: 4),
                              Text(
                                fact.fact,
                                style: TextStyles.font16BlackRegular,
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.info_outline,
                          size: 20,
                          color: ColorsManager.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        if (state is FactsFailure) {
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
                    context.read<FactsCubit>().loadFactsFromBreeds();
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
