import '../models/revenue.dart';

abstract class DashboardRepository {
  Future<Revenue> fetchRevenue();
}
