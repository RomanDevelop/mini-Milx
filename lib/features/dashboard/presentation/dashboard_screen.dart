import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/get_dashboard_data_usecase.dart';
import '../../../core/widgets/styled_widgets.dart';
import '../../../core/widgets/custom_bottom_navigation.dart';
import '../../../core/widgets/transaction_item.dart';
import '../../../core/widgets/status_bar_widget.dart';
import '../../../core/widgets/background_widget.dart';
import '../../../core/theme/app_theme.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _currentIndex = 0;
  bool _showFullTransactions = false;

  @override
  void initState() {
    super.initState();
    // Скрываем системный статус бар
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    // Восстанавливаем системный статус бар
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final revenueAsync = ref.watch(getDashboardDataProvider);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ModernBackground(
        child: Stack(
          children: [
            // Статус бар
            const ModernStatusBar(),

            // Основной контент
            SafeArea(
              child: revenueAsync.when(
                data: (revenue) => Column(
                  children: [
                    // Верхняя секция с балансом
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),

                          // Available Funds
                          Text(
                            'Available Funds',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),

                          const SizedBox(height: 8),

                          // Баланс
                          Text(
                            '\$3,546',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 36,
                                ),
                          ),
                        ],
                      ),
                    ),

                    // Расширяемое пространство
                    Expanded(
                      child: Container(),
                    ),

                    // Отступ для таббара
                    const SizedBox(height: 20),

                    // Карточка с транзакциями внизу
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      height: _showFullTransactions
                          ? MediaQuery.of(context).size.height * 0.6
                          : 120,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 20,
                            offset: const Offset(0, -5),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          // Заголовок транзакций
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent transactions',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.textPrimary,
                                      ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showFullTransactions =
                                          !_showFullTransactions;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        _showFullTransactions
                                            ? 'Show less'
                                            : 'View all',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: AppTheme.primaryBlue,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(
                                        _showFullTransactions
                                            ? Icons.keyboard_arrow_down
                                            : Icons.keyboard_arrow_up,
                                        color: AppTheme.primaryBlue,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Список транзакций
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const ClampingScrollPhysics(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  TransactionItem(
                                    name: 'Alex SMM',
                                    amount: '\$236.00',
                                    date: '12.04.2023, 18:00',
                                    icon: Icons.person,
                                  ),
                                  const Divider(height: 1),
                                  TransactionItem(
                                    name: 'Personal Binance',
                                    amount: '\$1,120.00',
                                    date: '11.04.2023, 15:30',
                                    icon: Icons.currency_bitcoin,
                                  ),
                                  const Divider(height: 1),
                                  TransactionItem(
                                    name: 'Studio rent',
                                    amount: '\$738.00',
                                    date: '10.04.2023, 12:15',
                                    icon: Icons.business,
                                  ),
                                  const Divider(height: 1),
                                  TransactionItem(
                                    name: 'YouTube Revenue',
                                    amount: '\$2,450.00',
                                    date: '09.04.2023, 09:45',
                                    icon: Icons.play_circle_outline,
                                    isExpense: false,
                                  ),
                                  const Divider(height: 1),
                                  TransactionItem(
                                    name: 'Sponsorship',
                                    amount: '\$1,800.00',
                                    date: '08.04.2023, 14:20',
                                    icon: Icons.star,
                                    isExpense: false,
                                  ),
                                  // Дополнительные транзакции (показываются только при развернутом виде)
                                  if (_showFullTransactions) ...[
                                    const Divider(height: 1),
                                    TransactionItem(
                                      name: 'Freelance Project',
                                      amount: '\$890.00',
                                      date: '07.04.2023, 16:30',
                                      icon: Icons.work,
                                      isExpense: false,
                                    ),
                                    const Divider(height: 1),
                                    TransactionItem(
                                      name: 'Coffee Shop',
                                      amount: '\$12.50',
                                      date: '07.04.2023, 10:15',
                                      icon: Icons.coffee,
                                    ),
                                    const Divider(height: 1),
                                    TransactionItem(
                                      name: 'Online Course',
                                      amount: '\$299.00',
                                      date: '06.04.2023, 14:20',
                                      icon: Icons.school,
                                    ),
                                    const Divider(height: 1),
                                    TransactionItem(
                                      name: 'Design Contract',
                                      amount: '\$1,500.00',
                                      date: '06.04.2023, 11:45',
                                      icon: Icons.design_services,
                                      isExpense: false,
                                    ),
                                    const Divider(height: 1),
                                    TransactionItem(
                                      name: 'Grocery Shopping',
                                      amount: '\$85.30',
                                      date: '05.04.2023, 18:00',
                                      icon: Icons.shopping_cart,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),

                          // Отступ для таббара
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
                loading: () => const StyledLoadingIndicator(
                  message: 'Loading your dashboard...',
                ),
                error: (e, _) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: AppTheme.textSecondary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Oops! Something went wrong',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppTheme.textPrimary,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Please try again later',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.textSecondary,
                            ),
                      ),
                      const SizedBox(height: 16),
                      GradientButton(
                        text: 'Retry',
                        icon: Icons.refresh,
                        onPressed: () => ref.refresh(getDashboardDataProvider),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Таббар
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavigation(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
