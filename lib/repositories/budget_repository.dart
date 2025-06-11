import 'package:finance_tracker_with_currency_converter/models/budget.dart';

abstract class BudgetRepository {
  Future<Budget> getBudget();
  Future<void> saveBudget(Budget budget);
}

class MemoryBudgetRepository implements BudgetRepository {
  Budget _currentBudget =  Budget(
    monthlyBudget: 0.0,
    budgetStartDate: DateTime(2023, 1, 1),
  );

  @override
  Future<Budget> getBudget() async {
    await Future.delayed(const Duration(milliseconds: 300)); // Simulate delay
    return _currentBudget;
  }

  @override
  Future<void> saveBudget(Budget budget) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _currentBudget = budget;
  }
}

