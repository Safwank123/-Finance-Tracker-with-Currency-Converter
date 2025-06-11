part of 'budget_bloc.dart';

abstract class BudgetEvent extends Equatable {
  const BudgetEvent();

  @override
  List<Object> get props => [];
}

class LoadBudget extends BudgetEvent {}

class SetMonthlyBudget extends BudgetEvent {
  final double amount;

  const SetMonthlyBudget(this.amount);

  @override
  List<Object> get props => [amount];
}

class ResetBudget extends BudgetEvent {}

class UpdateBudgetStartDate extends BudgetEvent {
  final DateTime newDate;

  const UpdateBudgetStartDate(this.newDate);

  @override
  List<Object> get props => [newDate];
}