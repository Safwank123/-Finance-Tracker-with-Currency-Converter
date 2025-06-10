import 'package:finance_tracker_with_currency_converter/screens/add_expense_screen.dart';
import 'package:finance_tracker_with_currency_converter/widgets/budget_progress_card.dart';
import 'package:finance_tracker_with_currency_converter/widgets/expense_list.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  // Mock data for UI demonstration
  final double monthlyBudget = 2000.00;
  final double totalSpent = 1250.50;
  final Map<String, List<Map<String, dynamic>>> groupedExpenses = {
    'June 10, 2023': [
      {
        'title': 'Grocery Shopping',
        'amount': 85.75,
        'category': 'Food',
        'date': DateTime(2023, 6, 10),
      },
      {
        'title': 'Taxi Ride',
        'amount': 15.50,
        'category': 'Transport',
        'date': DateTime(2023, 6, 10),
      },
    ],
    'June 9, 2023': [
      {
        'title': 'Movie Tickets',
        'amount': 24.00,
        'category': 'Entertainment',
        'date': DateTime(2023, 6, 9),
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.currency_exchange),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          BudgetProgressCard(
            totalSpent: totalSpent,
            monthlyBudget: monthlyBudget,
          ),
          Expanded(
            child: groupedExpenses.isEmpty
                ? const Center(
                    child: Text(
                      'No expenses yet!\nAdd your first expense.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ExpenseList(groupedExpenses: groupedExpenses),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpenseScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}