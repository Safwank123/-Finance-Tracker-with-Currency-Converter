import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:finance_tracker_with_currency_converter/models/budget.dart';
import 'package:finance_tracker_with_currency_converter/repositories/budget_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final BudgetRepository _budgetRepository;

  BudgetBloc(this._budgetRepository) : super( BudgetState()) {
    on<LoadBudget>(_onLoadBudget);
    on<SetMonthlyBudget>(_onSetMonthlyBudget);
    on<ResetBudget>(_onResetBudget);
    on<UpdateBudgetStartDate>(_onUpdateBudgetStartDate);
  }

  Future<void> _onLoadBudget(
    LoadBudget event,
    Emitter<BudgetState> emit,
  ) async {
    emit(state.copyWith(status: BudgetStatus.loading));
    try {
      final budget = await _budgetRepository.getBudget();
      emit(state.copyWith(
        status: BudgetStatus.success,
        monthlyBudget: budget.monthlyBudget,
        budgetStartDate: budget.budgetStartDate,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BudgetStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onSetMonthlyBudget(
    SetMonthlyBudget event,
    Emitter<BudgetState> emit,
  ) async {
    emit(state.copyWith(status: BudgetStatus.loading));
    try {
      await _budgetRepository.saveBudget(
        Budget(
          monthlyBudget: event.amount,
          budgetStartDate: state.budgetStartDate,
        ),
      );
      emit(state.copyWith(
        status: BudgetStatus.success,
        monthlyBudget: event.amount,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BudgetStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onResetBudget(
    ResetBudget event,
    Emitter<BudgetState> emit,
  ) async {
    emit(state.copyWith(status: BudgetStatus.loading));
    try {
      await _budgetRepository.saveBudget(
        Budget(
          monthlyBudget: 0.0,
          budgetStartDate: DateTime(2023, 1, 1),
        ),
      );
      emit( BudgetState(
        status: BudgetStatus.success,
        monthlyBudget: 0.0,
        budgetStartDate: DateTime(2023, 1, 1),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BudgetStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateBudgetStartDate(
    UpdateBudgetStartDate event,
    Emitter<BudgetState> emit,
  ) async {
    emit(state.copyWith(status: BudgetStatus.loading));
    try {
      await _budgetRepository.saveBudget(
        Budget(
          monthlyBudget: state.monthlyBudget,
          budgetStartDate: event.newDate,
        ),
      );
      emit(state.copyWith(
        status: BudgetStatus.success,
        budgetStartDate: event.newDate,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BudgetStatus.failure,
        error: e.toString(),
      ));
    }
  }
}