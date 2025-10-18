import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/images_cubit.dart';
import '../logic/images_states.dart';

class ImagesBlocListener extends StatelessWidget {
  const ImagesBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImagesCubit, ImagesStates>(
      listener: (context, state) {
        if (state is ImagesFailure) {
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
