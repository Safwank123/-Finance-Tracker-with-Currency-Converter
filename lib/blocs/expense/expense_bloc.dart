import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:finance_tracker_with_currency_converter/models/expense.dart';
import 'package:finance_tracker_with_currency_converter/repositories/expense_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository _expenseRepository;

  ExpenseBloc(this._expenseRepository) : super(const ExpenseState()) {
    on<LoadExpenses>(_onLoadExpenses);
    on<AddExpense>(_onAddExpense);
    on<UpdateExpense>(_onUpdateExpense);
    on<DeleteExpense>(_onDeleteExpense);
  }

  Future<void> _onLoadExpenses(
    LoadExpenses event,
    Emitter<ExpenseState> emit,
  ) async {
    emit(state.copyWith(status: ExpenseStatus.loading));
    try {
      final expenses = await _expenseRepository.getExpenses();
      final total = expenses.fold(0.0, (sum, expense) => sum + expense.amount);
      emit(state.copyWith(
        status: ExpenseStatus.success,
        expenses: expenses,
        totalAmount: total,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ExpenseStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onAddExpense(
    AddExpense event,
    Emitter<ExpenseState> emit,
  ) async {
    await _expenseRepository.addExpense(event.expense);
    add(LoadExpenses());
  }

  Future<void> _onUpdateExpense(
    UpdateExpense event,
    Emitter<ExpenseState> emit,
  ) async {
    await _expenseRepository.updateExpense(event.expense);
    add(LoadExpenses());
  }

  Future<void> _onDeleteExpense(
    DeleteExpense event,
    Emitter<ExpenseState> emit,
  ) async {
    await _expenseRepository.deleteExpense(event.expenseId);
    add(LoadExpenses());
  }
}