import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/breed/presentation/logic/breed_cubit.dart';
import '../../features/breed/presentation/screens/breed_screen.dart';
import '../../features/images/presentation/logic/images_cubit.dart';
import '../../features/images/presentation/screens/images_screen.dart';
import '../di/dependency_injection.dart';
import '../theming/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      BlocProvider(
        create: (_) => getIt<BreedCubit>(),
        child: const BreedScreen(),
      ),
      BlocProvider(
        create: (_) => getIt<ImagesCubit>(),
        child: const ImagesScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: ColorsManager.primary,
        unselectedItemColor: ColorsManager.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Breeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Images',
          ),
        ],
      ),
    );
  }
}
