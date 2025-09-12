# E-Logistika

A Flutter application built with Clean Architecture principles.

## Features

- **Clean Architecture**: Follows clean architecture principles with clear separation of concerns
- **State Management**: Uses BLoC pattern for state management
- **Dependency Injection**: Uses GetIt and Injectable for dependency injection
- **Network Layer**: Uses Dio and Retrofit for API communication
- **Local Storage**: Uses SharedPreferences for local data storage
- **Authentication**: Complete authentication flow with login and registration

## Architecture

The project follows Clean Architecture with the following layers:

### Core Layer
- **Constants**: API and app constants
- **Errors**: Custom exceptions and failures
- **Network**: Dio client and network utilities
- **Use Cases**: Base use case classes
- **Utils**: Utility functions and validators
- **DI**: Dependency injection setup

### Features Layer
Each feature follows the same structure:
- **Data**: Data sources, models, and repository implementations
- **Domain**: Entities, repositories, and use cases
- **Presentation**: BLoC, pages, and widgets

## Getting Started

### Prerequisites

- Flutter SDK (3.9.0 or higher)
- Dart SDK
- Android Studio / VS Code

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate code:
   ```bash
   flutter packages pub run build_runner build
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── usecases/
│   ├── utils/
│   └── di/
├── features/
│   └── auth/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
└── main.dart
```

## Dependencies

### Main Dependencies
- `flutter_bloc`: State management
- `get_it`: Dependency injection
- `injectable`: Code generation for DI
- `dio`: HTTP client
- `retrofit`: Type-safe HTTP client
- `shared_preferences`: Local storage
- `equatable`: Value equality
- `dartz`: Functional programming

### Dev Dependencies
- `build_runner`: Code generation
- `injectable_generator`: DI code generation
- `retrofit_generator`: Retrofit code generation
- `json_serializable`: JSON serialization

## API Configuration

Update the API base URL in `lib/core/constants/api_constants.dart`:

```dart
static const String baseUrl = 'https://your-api-url.com/api/v1';
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests
5. Submit a pull request

## License

This project is licensed under the MIT License.