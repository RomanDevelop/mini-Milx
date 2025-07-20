import '../domain/models/revenue.dart';
import '../domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<Revenue> fetchRevenue() async {
    // Имитация задержки сети
    await Future.delayed(const Duration(milliseconds: 400));
    return Revenue(current: 1234.56, totalThisMonth: 4500.00);
  }
}
