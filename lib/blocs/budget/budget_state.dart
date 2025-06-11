part of 'budget_bloc.dart';

enum BudgetStatus { initial, loading, success, failure }

class BudgetState extends Equatable {
  final BudgetStatus status;
  final double monthlyBudget;
  final DateTime budgetStartDate;
  final String? error;

  BudgetState({
    this.status = BudgetStatus.initial,
    this.monthlyBudget = 0.0,
    DateTime? budgetStartDate,  // Make this nullable
    this.error,
  }) : budgetStartDate = budgetStartDate ?? DateTime(2023, 1, 1); 

  BudgetState copyWith({
    BudgetStatus? status,
    double? monthlyBudget,
    DateTime? budgetStartDate,
    String? error,
  }) {
    return BudgetState(
      status: status ?? this.status,
      monthlyBudget: monthlyBudget ?? this.monthlyBudget,
      budgetStartDate: budgetStartDate ?? this.budgetStartDate,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, monthlyBudget, budgetStartDate, error];
}