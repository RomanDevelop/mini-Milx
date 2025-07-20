# MiniMilx - Financial Hub for YouTube Creators

A Flutter demo project showcasing a financial hub for YouTube creators, built with **Flutter Riverpod Best Practices** architecture.

## 🚀 Features

- **Financial Dashboard** - View current balance and monthly earnings
- **Advance Funds** - Request early access to earnings
- **Withdrawal** - Transfer funds to bank, PayPal, or crypto wallets
- **P2P Transfers** - Send money to other creators
- **Authentication** - Secure login system (mock implementation)
- **Responsive Design** - Works on mobile and web platforms

## 🏗️ Architecture

This project follows **Clean Architecture** with **MVVM** pattern using **Riverpod** for state management:

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # App configuration
├── router/                   # Navigation
├── core/                     # Shared utilities
│   ├── theme/               # App theming
│   ├── constants/           # App constants
│   └── widgets/             # Shared widgets
├── features/                # Feature modules
│   ├── auth/               # Authentication
│   ├── dashboard/          # Financial dashboard
│   ├── advance_funds/      # Advance requests
│   ├── withdrawal/         # Fund withdrawals
│   └── p2p_transfer/       # P2P transfers
├── services/               # External services
└── utils/                  # Utility functions
```

Each feature follows the **Domain-Driven Design** structure:

- **domain/** - Business logic and models
- **application/** - Use cases and business rules
- **infrastructure/** - Data sources and implementations
- **presentation/** - UI components and screens

## 🛠️ Technologies

- **Flutter 3.x+** - UI framework
- **Riverpod 2.x** - State management
- **GoRouter** - Navigation
- **Dio** - HTTP client
- **Intl** - Internationalization

## 📱 Screenshots

### Dashboard

- Current balance display
- Monthly earnings overview
- Quick action buttons for all features

### Advance Funds

- Amount input with validation
- Optional reason field
- Real-time form validation

### Withdrawal

- Multiple withdrawal methods (Bank, PayPal, Crypto)
- Dynamic form fields based on method
- Amount validation

### P2P Transfer

- Recipient selection
- Amount and message input
- Secure transfer process

## 🚀 Getting Started

### Prerequisites

- Flutter 3.x+
- Dart 3.x+
- Android Studio / VS Code

### Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/mini_milx.git
cd mini_milx
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

### Web Support

```bash
flutter run -d chrome
```

## 🏗️ Project Structure Details

### State Management with Riverpod

The project uses **AsyncNotifier** for async operations and **StateNotifier** for simple state:

```dart
// Example: Dashboard data provider
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

### Navigation with GoRouter

Clean routing setup with type-safe navigation:

```dart
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const DashboardScreen()),
    GoRoute(path: '/advance', builder: (_, __) => const AdvanceFundsScreen()),
    // ... more routes
  ],
);
```

### Repository Pattern

Abstract repositories with concrete implementations:

```dart
// Abstract repository
abstract class DashboardRepository {
  Future<Revenue> fetchRevenue();
}

// Concrete implementation
class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<Revenue> fetchRevenue() async {
    // Implementation with mock data
    await Future.delayed(const Duration(milliseconds: 400));
    return Revenue(current: 1234.56, totalThisMonth: 4500.00);
  }
}
```

## 🎨 UI/UX Features

- **Material Design 3** - Modern, adaptive design
- **Responsive Layout** - Works on all screen sizes
- **Loading States** - Smooth user experience
- **Error Handling** - User-friendly error messages
- **Form Validation** - Real-time input validation
- **Dark/Light Theme** - Theme switching support

## 🔧 Configuration

### Environment Setup

- Mock API endpoints in `lib/services/api_service.dart`
- Authentication service in `lib/services/auth_service.dart`
- App constants in `lib/core/constants/app_constants.dart`

### Theming

- Light and dark themes in `lib/core/theme/app_theme.dart`
- Custom color schemes and typography
- Consistent spacing and elevation

## 📊 Mock Data

The app uses realistic mock data to simulate a real financial platform:

- **Current Balance**: $1,234.56
- **Monthly Total**: $4,500.00
- **Transaction Limits**: Configurable in constants
- **Validation Rules**: Real-world business logic

## 🚀 Future Enhancements

- [ ] Real API integration
- [ ] Push notifications
- [ ] Biometric authentication
- [ ] Transaction history
- [ ] Analytics dashboard
- [ ] Multi-language support
- [ ] Unit and widget tests
- [ ] CI/CD pipeline

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Follow the existing code style
4. Add tests for new features
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod team for excellent state management
- Material Design team for design guidelines

---

**MiniMilx** - Empowering YouTube creators with financial tools! 🎬💰
