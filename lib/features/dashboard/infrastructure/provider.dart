import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dashboard_repository_impl.dart';
import '../domain/repositories/dashboard_repository.dart';

final dashboardRepositoryProvider =
    Provider<DashboardRepository>((ref) => DashboardRepositoryImpl());
