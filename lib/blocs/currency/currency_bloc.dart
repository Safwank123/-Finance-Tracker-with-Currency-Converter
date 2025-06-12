import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_tracker_with_currency_converter/models/currency_rate.dart';
import 'package:finance_tracker_with_currency_converter/repositories/currency_repository.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepository _currencyRepository;

  CurrencyBloc(this._currencyRepository) : super(const CurrencyState()) {
    on<LoadExchangeRates>(_onLoadExchangeRates);
    on<ChangeBaseCurrency>(_onChangeBaseCurrency);
  }

  Future<void> _onLoadExchangeRates(
    LoadExchangeRates event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(state.copyWith(status: CurrencyStatus.loading));
    try {
      final rates = await _currencyRepository.fetchExchangeRates(event.baseCurrency);
      emit(state.copyWith(
        status: CurrencyStatus.success,
        rates: rates,
        baseCurrency: event.baseCurrency,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CurrencyStatus.failure,
        error: e.toString(),
      ));
    }
  }

  void _onChangeBaseCurrency(
    ChangeBaseCurrency event,
    Emitter<CurrencyState> emit,
  ) {
    emit(state.copyWith(baseCurrency: event.newCurrency));
    add(LoadExchangeRates(event.newCurrency));
  }
}