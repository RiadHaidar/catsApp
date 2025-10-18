import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/facts_cubit.dart';
import '../logic/facts_states.dart';

class FactsBlocListener extends StatelessWidget {
  const FactsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FactsCubit, FactsStates>(
      listener: (context, state) {
        if (state is FactsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }

        if (state is BreedFactsSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Loaded ${state.facts.length} breed facts'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
            ),
          );
        }

        if (state is BreedFactsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
