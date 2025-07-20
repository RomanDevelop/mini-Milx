# MiniMilx - Setup Instructions

## 🚀 Quick Setup

### 1. Prerequisites

- Flutter 3.x+ installed
- Dart 3.x+
- IDE (VS Code, Android Studio, or Cursor)
- Git

### 2. Clone and Setup

```bash
# Clone the repository
git clone <your-repo-url>
cd mini_milx

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### 3. Web Development

```bash
# Run on web
flutter run -d chrome

# Build for production
flutter build web
```

## 📱 Platform Support

### ✅ Supported Platforms

- **Web** - Full support with responsive design
- **Android** - Ready for mobile development
- **iOS** - Ready for mobile development
- **macOS** - Desktop support
- **Windows** - Desktop support
- **Linux** - Desktop support

### 🎯 Recommended Development

- **Web**: `flutter run -d chrome`
- **Mobile**: `flutter run -d <device-id>`

## 🏗️ Architecture Overview

### Clean Architecture Implementation

```
lib/
├── main.dart                 # App entry point with ProviderScope
├── app.dart                  # MaterialApp.router configuration
├── router/                   # GoRouter navigation
├── core/                     # Shared utilities
│   ├── theme/               # App theming (light/dark)
│   ├── constants/           # App constants
│   └── widgets/             # Shared widgets
├── features/                # Feature modules
│   ├── auth/               # Authentication
│   │   ├── domain/         # Models & interfaces
│   │   ├── application/    # Use cases
│   │   ├── infrastructure/ # Implementations
│   │   └── presentation/   # UI screens
│   ├── dashboard/          # Financial dashboard
│   ├── advance_funds/      # Advance requests
│   ├── withdrawal/         # Fund withdrawals
│   └── p2p_transfer/       # P2P transfers
├── services/               # External services
│   ├── api_service.dart    # HTTP client (Dio)
│   └── auth_service.dart   # Authentication
└── utils/                  # Utility functions
    └── formatters.dart     # Data formatting
```

### State Management

- **Riverpod 2.x** for state management
- **AsyncNotifier** for async operations
- **Provider** for dependency injection

### Navigation

- **GoRouter** for type-safe navigation
- Clean URL structure
- Deep linking support

## 🎨 UI Features

### Design System

- **Material Design 3** implementation
- **Light/Dark theme** support
- **Responsive design** for all screen sizes
- **Consistent spacing** and typography

### Key Components

- **Dashboard** - Financial overview with cards
- **Forms** - Validated input forms with Material Design
- **Loading States** - Smooth loading indicators
- **Error Handling** - User-friendly error messages

## 🔧 Configuration

### Environment Setup

1. **API Configuration**: Edit `lib/services/api_service.dart`
2. **Constants**: Modify `lib/core/constants/app_constants.dart`
3. **Theme**: Customize `lib/core/theme/app_theme.dart`

### Mock Data

The app uses realistic mock data:

- Current Balance: $1,234.56
- Monthly Total: $4,500.00
- Transaction limits and validation rules

## 🚀 Development Workflow

### 1. Start Development Server

```bash
# For web development
flutter run -d chrome

# For mobile development
flutter run
```

### 2. Hot Reload

- Save files to trigger hot reload
- Use `r` in terminal for hot restart
- Use `R` in terminal for hot restart with state reset

### 3. Debug Mode

```bash
# Run in debug mode
flutter run --debug

# Run with performance profiling
flutter run --profile
```

## 📊 Available Features

### 1. Dashboard (`/`)

- **Current Balance** display
- **Monthly Earnings** overview
- **Quick Action** buttons
- **Real-time** data loading

### 2. Login (`/login`)

- **Email/Password** authentication
- **Form validation**
- **Loading states**
- **Guest mode** option

### 3. Advance Funds (`/advance`)

- **Amount input** with validation
- **Reason field** (optional)
- **Maximum limit** enforcement
- **Success feedback**

### 4. Withdrawal (`/withdrawal`)

- **Multiple methods**: Bank, PayPal, Crypto
- **Dynamic forms** based on method
- **Amount validation**
- **Account details** input

### 5. P2P Transfer (`/p2p`)

- **Recipient selection**
- **Amount and message** input
- **Transfer confirmation**
- **Success notification**

## 🔍 Testing

### Run Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

### Widget Testing

```bash
# Run widget tests
flutter test test/widget_test.dart
```

## 📦 Build & Deploy

### Web Build

```bash
# Build for production
flutter build web

# Build with specific base href
flutter build web --base-href "/mini_milx/"
```

### Mobile Build

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

## 🛠️ Troubleshooting

### Common Issues

1. **Dependencies not found**

   ```bash
   flutter clean
   flutter pub get
   ```

2. **Build errors**

   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

3. **Hot reload not working**

   - Press `r` for hot restart
   - Press `R` for hot restart with state reset

4. **Web not loading**
   ```bash
   flutter run -d chrome --web-port 8080
   ```

### Performance Tips

1. **Use const constructors** where possible
2. **Implement proper widget keys** for lists
3. **Use Riverpod efficiently** with proper provider scoping
4. **Optimize images** for web deployment

## 📚 Next Steps

### For Development

1. **Add real API integration**
2. **Implement authentication**
3. **Add more features**
4. **Write comprehensive tests**

### For Production

1. **Set up CI/CD pipeline**
2. **Configure environment variables**
3. **Add analytics**
4. **Implement error tracking**

## 🤝 Support

- **Documentation**: Check `README.md` and `DEVELOPMENT.md`
- **Issues**: Create GitHub issues for bugs
- **Features**: Submit pull requests for new features

---

**MiniMilx** is ready for development! 🚀

Start building the future of creator finance! 💰
