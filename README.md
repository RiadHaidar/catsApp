# Cat App

A Flutter application that displays cat breeds and images using The Cat API. Built with Clean Architecture principles and modern Flutter development practices.

## Features

### 🐱 Breeds Feature
- Browse a list of cat breeds with detailed information
- View breed details including temperament, origin, and characteristics
- Search and filter breeds

### 📸 Images Feature
- Browse cat images in a grid view
- High-quality images from The Cat API
- Smooth scrolling and loading

## Architecture

This project follows Clean Architecture principles with clear separation of concerns:

```
lib/
├── core/
│   ├── di/              # Dependency injection setup
│   ├── networking/      # API client configuration
│   ├── routing/         # Navigation setup
│   └── theming/         # App theme configuration
├── features/
│   ├── breed/
│   │   ├── data/        # Data layer (APIs, models, repos)
│   │   └── presentation/ # UI layer (screens, widgets, BLoC)
│   └── images/
│       ├── data/
│       └── presentation/
└── main.dart
```

## Tech Stack

- **State Management**: BLoC (flutter_bloc)
- **Networking**: Dio + Retrofit
- **Dependency Injection**: GetIt
- **Routing**: GoRouter
- **JSON Serialization**: json_serializable
- **API**: [The Cat API](https://thecatapi.com/)

## Testing

The project includes comprehensive test coverage:

- **Unit Tests**: Repository and Cubit logic
- **Widget Tests**: Individual screen components
- **Integration Tests**: Complete user flows

Run tests:
```bash
flutter test
```

## Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Generate code:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## API Configuration

This app uses The Cat API. No API key is required for basic usage.
