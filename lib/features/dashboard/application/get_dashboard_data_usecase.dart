import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/revenue.dart';
import '../infrastructure/provider.dart';

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
