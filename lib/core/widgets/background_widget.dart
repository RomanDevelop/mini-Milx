import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ModernBackground extends StatelessWidget {
  final Widget child;
  final bool showPattern;
  final bool showGradient;

  const ModernBackground({
    super.key,
    required this.child,
    this.showPattern = true,
    this.showGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: showGradient
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.primaryBlue,
                  AppTheme.primaryPurple,
                  AppTheme.surfaceColor,
                ],
                stops: [0.0, 0.6, 1.0],
              )
            : null,
      ),
      child: Stack(
        children: [
          // Фоновое изображение
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Градиентный оверлей для лучшей читаемости
          if (showGradient)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.primaryBlue.withValues(alpha: 0.7),
                      AppTheme.primaryPurple.withValues(alpha: 0.5),
                      AppTheme.surfaceColor.withValues(alpha: 0.3),
                    ],
                    stops: const [0.0, 0.6, 1.0],
                  ),
                ),
              ),
            ),

          // Фоновый паттерн
          if (showPattern) _buildBackgroundPattern(),

          // Основной контент
          child,
        ],
      ),
    );
  }

  Widget _buildBackgroundPattern() {
    return Positioned.fill(
      child: CustomPaint(
        painter: BackgroundPatternPainter(),
      ),
    );
  }
}

class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.03)
      ..style = PaintingStyle.fill;

    // Рисуем круги разного размера
    final circles = [
      Offset(size.width * 0.1, size.height * 0.2),
      Offset(size.width * 0.8, size.height * 0.1),
      Offset(size.width * 0.9, size.height * 0.4),
      Offset(size.width * 0.2, size.height * 0.6),
      Offset(size.width * 0.7, size.height * 0.8),
    ];

    final radii = [80.0, 120.0, 60.0, 100.0, 90.0];

    for (int i = 0; i < circles.length; i++) {
      canvas.drawCircle(circles[i], radii[i], paint);
    }

    // Рисуем линии
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.02)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Горизонтальные линии
    for (int i = 0; i < 5; i++) {
      final y = size.height * (0.1 + i * 0.15);
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        linePaint,
      );
    }

    // Вертикальные линии
    for (int i = 0; i < 3; i++) {
      final x = size.width * (0.2 + i * 0.3);
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
