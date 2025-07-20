# Development Guide - MiniMilx

## 🚀 Quick Start

### Prerequisites

- Flutter 3.x+
- Dart 3.x+
- IDE (VS Code, Android Studio)

### Setup

```bash
git clone <repository>
cd mini_milx
flutter pub get
flutter run
```

## 🏗️ Architecture Overview

### Clean Architecture Layers

1. **Domain Layer** (`domain/`)

   - Business entities and models
   - Repository interfaces
   - Business rules

2. **Application Layer** (`application/`)

   - Use cases
   - Business logic
   - Riverpod providers

3. **Infrastructure Layer** (`infrastructure/`)

   - Repository implementations
   - Data sources
   - External service integrations

4. **Presentation Layer** (`presentation/`)
   - UI components
   - Screens
   - Widgets

### State Management with Riverpod

#### AsyncNotifier Example

```dart
final getDashboardDataProvider =
    AsyncNotifierProvider<GetDashboardDataUseCase, Revenue>(
        GetDashboardDataUseCase.new);

class GetDashboardDataUseCase extends AsyncNotifier<Revenue> {
  @override
  Future<Revenue> build() {
    final repo = ref.read(dashboardRepositoryProvider);
    return repo.fetchRevenue();
  }
}
```

#### Usage in Widgets

```dart
class DashboardScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revenueAsync = ref.watch(getDashboardDataProvider);

    return revenueAsync.when(
      data: (revenue) => Text('Balance: \$${revenue.current}'),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
```

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── app.dart                     # App configuration
├── router/
│   └── app_router.dart         # Navigation setup
├── core/
│   ├── theme/
│   │   └── app_theme.dart      # App theming
│   ├── constants/
│   │   └── app_constants.dart  # App constants
│   └── widgets/                # Shared widgets
├── features/
│   ├── auth/                   # Authentication feature
│   │   ├── domain/
│   │   ├── application/
│   │   ├── infrastructure/
│   │   └── presentation/
│   ├── dashboard/              # Dashboard feature
│   ├── advance_funds/          # Advance funds feature
│   ├── withdrawal/             # Withdrawal feature
│   └── p2p_transfer/           # P2P transfer feature
├── services/
│   ├── api_service.dart        # HTTP client
│   └── auth_service.dart       # Authentication
└── utils/
    └── formatters.dart         # Utility functions
```

## 🎨 UI/UX Guidelines

### Theme Usage

```dart
// Use theme colors
Theme.of(context).colorScheme.primary
Theme.of(context).colorScheme.surface

// Use theme text styles
Theme.of(context).textTheme.headlineLarge
Theme.of(context).textTheme.bodyMedium
```

### Responsive Design

```dart
// Use MediaQuery for responsive layouts
MediaQuery.of(context).size.width
MediaQuery.of(context).size.height

// Use LayoutBuilder for custom responsive behavior
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return DesktopLayout();
    }
    return MobileLayout();
  },
)
```

## 🔧 Development Workflow

### Adding a New Feature

1. **Create Domain Models**

```dart
// lib/features/new_feature/domain/models/new_model.dart
class NewModel {
  final String id;
  final String name;

  NewModel({required this.id, required this.name});
}
```

2. **Create Repository Interface**

```dart
// lib/features/new_feature/domain/repositories/new_repository.dart
abstract class NewRepository {
  Future<List<NewModel>> fetchData();
}
```

3. **Create Repository Implementation**

```dart
// lib/features/new_feature/infrastructure/new_repository_impl.dart
class NewRepositoryImpl implements NewRepository {
  @override
  Future<List<NewModel>> fetchData() async {
    // Implementation
  }
}
```

4. **Create Provider**

```dart
// lib/features/new_feature/infrastructure/provider.dart
final newRepositoryProvider = Provider<NewRepository>(
  (ref) => NewRepositoryImpl(),
);
```

5. **Create Use Case**

```dart
// lib/features/new_feature/application/get_data_usecase.dart
final getDataProvider = AsyncNotifierProvider<GetDataUseCase, List<NewModel>>(
  GetDataUseCase.new,
);

class GetDataUseCase extends AsyncNotifier<List<NewModel>> {
  @override
  Future<List<NewModel>> build() {
    final repo = ref.read(newRepositoryProvider);
    return repo.fetchData();
  }
}
```

6. **Create UI Screen**

```dart
// lib/features/new_feature/presentation/new_screen.dart
class NewScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(getDataProvider);

    return Scaffold(
      appBar: AppBar(title: Text('New Feature')),
      body: dataAsync.when(
        data: (data) => ListView.builder(...),
        loading: () => CircularProgressIndicator(),
        error: (error, stack) => Text('Error: $error'),
      ),
    );
  }
}
```

7. **Add Route**

```dart
// lib/router/app_router.dart
GoRoute(
  path: '/new-feature',
  builder: (_, __) => const NewScreen(),
),
```

### Code Style Guidelines

1. **File Naming**

   - Use snake_case for file names
   - Use descriptive names: `user_profile_screen.dart`

2. **Class Naming**

   - Use PascalCase for class names
   - Use descriptive names: `UserProfileScreen`

3. **Variable Naming**

   - Use camelCase for variables
   - Use descriptive names: `userProfileData`

4. **Constants**
   - Use UPPER_SNAKE_CASE for constants
   - Place in `lib/core/constants/`

### Testing Guidelines

1. **Unit Tests**

   - Test business logic in use cases
   - Test repository implementations
   - Test utility functions

2. **Widget Tests**

   - Test UI components
   - Test user interactions
   - Test navigation

3. **Integration Tests**
   - Test complete user flows
   - Test API integrations

## 🔍 Debugging

### Riverpod DevTools

```bash
flutter pub global activate riverpod_generator
flutter pub run build_runner build
```

### Debug Prints

```dart
// Use debugPrint instead of print
debugPrint('Debug message');

// Use conditional debug prints
if (kDebugMode) {
  print('Debug only message');
}
```

### Performance Profiling

```bash
flutter run --profile
flutter run --trace-startup
```

## 📦 Dependencies

### Core Dependencies

- `flutter_riverpod`: State management
- `go_router`: Navigation
- `dio`: HTTP client
- `intl`: Internationalization

### Development Dependencies

- `build_runner`: Code generation
- `riverpod_generator`: Riverpod code generation
- `flutter_lints`: Code linting

## 🚀 Deployment

### Web Deployment

```bash
flutter build web
# Deploy build/web/ to your hosting service
```

### Mobile Deployment

```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release
```

## 🤝 Contributing

1. Follow the existing code style
2. Add tests for new features
3. Update documentation
4. Use conventional commit messages
5. Create descriptive pull requests

## 📚 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [GoRouter Documentation](https://gorouter.dev/)
- [Material Design Guidelines](https://material.io/design)

---

Happy coding! 🚀
