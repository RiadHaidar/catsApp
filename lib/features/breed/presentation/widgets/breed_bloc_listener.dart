import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/breed_cubit.dart';
import '../logic/breed_states.dart';

class BreedBlocListener extends StatelessWidget {
  const BreedBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BreedCubit, BreedStates>(
      listener: (context, state) {
        if (state is BreedsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }

        if (state is BreedDetailSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Loaded: ${state.breed.name}'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
            ),
          );
        }

        if (state is BreedDetailFailure) {
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
