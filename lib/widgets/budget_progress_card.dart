import 'package:flutter/material.dart';

class BudgetProgressCard extends StatelessWidget {
  final double totalSpent;
  final double monthlyBudget;

  const BudgetProgressCard({
    super.key,
    required this.totalSpent,
    required this.monthlyBudget,
  });

  @override
  Widget build(BuildContext context) {
    final progress = monthlyBudget > 0 ? totalSpent / monthlyBudget : 0;
    final remaining = monthlyBudget - totalSpent;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly Budget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: (progress > 1 ? 1 : progress).toDouble(),
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                progress > 0.8 ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Spent: \$${totalSpent.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: progress > 0.8 ? Colors.red : Colors.grey[700],
                  ),
                ),
                Text(
                  'Remaining: \$${remaining > 0 ? remaining.toStringAsFixed(2) : '0.00'}',
                  style: TextStyle(
                    color: remaining > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}