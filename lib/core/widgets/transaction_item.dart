import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TransactionItem extends StatelessWidget {
  final String name;
  final String amount;
  final String date;
  final IconData icon;
  final bool isExpense;

  const TransactionItem({
    super.key,
    required this.name,
    required this.amount,
    required this.date,
    required this.icon,
    this.isExpense = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          // Иконка с neumorphism эффектом
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.neumorphismLight,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.8),
                  blurRadius: 8,
                  offset: const Offset(0, -4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: AppTheme.textSecondary,
              size: 24,
            ),
          ),

          const SizedBox(width: 12),

          // Информация о транзакции
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                ),
              ],
            ),
          ),

          // Сумма с современной типографикой
          Text(
            '${isExpense ? '-' : '+'} $amount',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color:
                      isExpense ? AppTheme.textPrimary : AppTheme.successGreen,
                  letterSpacing: -0.5,
                ),
          ),
        ],
      ),
    );
  }
}
