import 'package:go_router/go_router.dart';
import '../features/dashboard/presentation/dashboard_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/advance_funds/presentation/advance_funds_screen.dart';
import '../features/withdrawal/presentation/withdrawal_screen.dart';
import '../features/p2p_transfer/presentation/p2p_transfer_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginScreen(),
    ),
    GoRoute(
      path: '/advance',
      builder: (_, __) => const AdvanceFundsScreen(),
    ),
    GoRoute(
      path: '/withdrawal',
      builder: (_, __) => const WithdrawalScreen(),
    ),
    GoRoute(
      path: '/p2p',
      builder: (_, __) => const P2PTransferScreen(),
    ),
  ],
);
