import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/modern_app_bar.dart';
import '../../../core/widgets/modern_widgets.dart';
import '../../../core/theme/app_theme.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _accountController = TextEditingController();
  String _selectedMethod = 'bank';
  bool _isLoading = false;

  @override
  void dispose() {
    _amountController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  Future<void> _withdraw() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Имитация вывода средств
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Withdrawal request submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ModernAppBar(
        title: 'Withdraw Funds',
        showBackButton: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.surfaceColor,
              Color(0xFFF1F5F9),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header Card
                  ModernCard(
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.orange.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withValues(alpha: 0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.account_balance_wallet,
                            size: 40,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Withdraw Funds',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textPrimary,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Transfer your earnings to your account',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppTheme.textSecondary,
                                  ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Amount Field
                  ModernTextField(
                    label: 'Amount (\$)',
                    hint: 'Enter amount to withdraw',
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: AppTheme.textSecondary,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      final amount = double.tryParse(value);
                      if (amount == null || amount <= 0) {
                        return 'Please enter a valid amount';
                      }
                      if (amount < 10) {
                        return 'Minimum withdrawal amount is \$10';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Withdrawal Method
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Colors.white.withValues(alpha: 0.8),
                          blurRadius: 10,
                          offset: const Offset(0, -4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: DropdownButtonFormField<String>(
                      value: _selectedMethod,
                      decoration: InputDecoration(
                        labelText: 'Withdrawal Method',
                        filled: true,
                        fillColor: AppTheme.neumorphismLight,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: AppTheme.primaryBlue, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        prefixIcon: Icon(
                          Icons.payment,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'bank',
                          child: Text('Bank Transfer'),
                        ),
                        DropdownMenuItem(
                          value: 'paypal',
                          child: Text('PayPal'),
                        ),
                        DropdownMenuItem(
                          value: 'crypto',
                          child: Text('Cryptocurrency'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedMethod = value!;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Account Number Field
                  ModernTextField(
                    label: _selectedMethod == 'bank'
                        ? 'Account Number'
                        : _selectedMethod == 'paypal'
                            ? 'PayPal Email'
                            : 'Wallet Address',
                    hint: 'Enter your account details',
                    controller: _accountController,
                    prefixIcon: Icon(
                      _selectedMethod == 'bank'
                          ? Icons.account_balance
                          : _selectedMethod == 'paypal'
                              ? Icons.email
                              : Icons.wallet,
                      color: AppTheme.textSecondary,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your account details';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 32),

                  // Withdraw Button
                  ModernGradientButton(
                    text: 'Withdraw Funds',
                    icon: Icons.send,
                    onPressed: _isLoading ? null : _withdraw,
                    isLoading: _isLoading,
                  ),

                  const SizedBox(height: 16),

                  // Cancel Button
                  OutlinedButton(
                    onPressed: () => context.go('/'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      side: BorderSide(
                          color: AppTheme.textSecondary.withValues(alpha: 0.3)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppTheme.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
