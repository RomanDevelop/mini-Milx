import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  late final Dio _dio;

  void initialize() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.minimilx.com', // Мок URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Добавляем интерцепторы для логирования
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => print(obj),
    ));
  }

  Dio get dio => _dio;

  // Мок методы для демонстрации
  Future<Map<String, dynamic>> getRevenue() async {
    // Имитация API вызова
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      'current': 1234.56,
      'totalThisMonth': 4500.00,
    };
  }

  Future<bool> requestAdvance(double amount, String reason) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> withdrawFunds(
      double amount, String method, String account) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> p2pTransfer(
      String recipient, double amount, String message) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
