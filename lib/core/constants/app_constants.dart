class AppConstants {
  // App Info
  static const String appName = 'MiniMilx';
  static const String appVersion = '1.0.0';

  // API Endpoints
  static const String baseUrl = 'https://api.minimilx.com';
  static const String revenueEndpoint = '/revenue';
  static const String advanceEndpoint = '/advance';
  static const String withdrawalEndpoint = '/withdrawal';
  static const String p2pEndpoint = '/p2p-transfer';

  // Validation
  static const int minPasswordLength = 6;
  static const int maxAdvanceAmount = 10000;
  static const int minWithdrawalAmount = 10;
  static const int minP2PAmount = 1;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  // Mock Data
  static const double mockCurrentBalance = 1234.56;
  static const double mockMonthlyTotal = 4500.00;
}
