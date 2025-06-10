part of 'expense_bloc.dart';

enum ExpenseStatus { initial, loading, success, failure }

class ExpenseState extends Equatable {
  final ExpenseStatus status;
  final List<Expense> expenses;
  final double totalAmount;
  final String? error;

  const ExpenseState({
    this.status = ExpenseStatus.initial,
    this.expenses = const [],
    this.totalAmount = 0.0,
    this.error,
  });

  ExpenseState copyWith({
    ExpenseStatus? status,
    List<Expense>? expenses,
    double? totalAmount,
    String? error,
  }) {
    return ExpenseState(
      status: status ?? this.status,
      expenses: expenses ?? this.expenses,
      totalAmount: totalAmount ?? this.totalAmount,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, expenses, totalAmount, error];
}