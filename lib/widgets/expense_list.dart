import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> groupedExpenses;

  const ExpenseList({
    super.key,
    required this.groupedExpenses,
  });

  @override
  Widget build(BuildContext context) {
    final sortedDates = groupedExpenses.keys.toList()
      ..sort((a, b) => DateFormat('MMMM d, y').parse(b).compareTo(
            DateFormat('MMMM d, y').parse(a),
          ));

    return ListView.builder(
      itemCount: sortedDates.length,
      itemBuilder: (context, index) {
        final date = sortedDates[index];
        final expenses = groupedExpenses[date]!;
        final totalForDay = expenses.fold(
            0.0, (sum, expense) => sum + (expense['amount'] as double));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '\$${totalForDay.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ...expenses.map((expense) => ExpenseItem(expense: expense)),
          ],
        );
      },
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final Map<String, dynamic> expense;

  const ExpenseItem({
    super.key,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            _getCategoryIcon(expense['category']),
            color: Colors.deepPurple,
          ),
        ),
        title: Text(expense['title']),
        subtitle: Text(expense['category']),
        trailing: Text(
          '\$${(expense['amount'] as double).toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: () {},
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return Icons.restaurant;
      case 'transport':
        return Icons.directions_car;
      case 'shopping':
        return Icons.shopping_bag;
      case 'entertainment':
        return Icons.movie;
      case 'bills':
        return Icons.receipt;
      default:
        return Icons.money;
    }
  }
}