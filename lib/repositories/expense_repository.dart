import 'package:finance_tracker_with_currency_converter/models/expense.dart';

abstract class ExpenseRepository {
  Future<List<Expense>> getExpenses();
  Future<void> addExpense(Expense expense);
  Future<void> updateExpense(Expense expense);
  Future<void> deleteExpense(String expenseId);
}

class ExpenseRepositoryImpl implements ExpenseRepository {
  final List<Expense> _expenses = [];

  @override
  Future<List<Expense>> getExpenses() async {
    // In a real app, you would fetch from database/API
    await Future.delayed(const Duration(milliseconds: 300)); // Simulate network delay
    return _expenses;
  }

  @override
  Future<void> addExpense(Expense expense) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _expenses.add(expense);
  }

  @override
  Future<void> updateExpense(Expense expense) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _expenses.indexWhere((e) => e.id == expense.id);
    if (index != -1) {
      _expenses[index] = expense;
    }
  }

  @override
  Future<void> deleteExpense(String expenseId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _expenses.removeWhere((e) => e.id == expenseId);
  }
}