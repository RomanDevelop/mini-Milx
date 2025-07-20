import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'core/theme/app_theme.dart';

class MiniMilxApp extends StatelessWidget {
  const MiniMilxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MiniMilx',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
