part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

class LoadExchangeRates extends CurrencyEvent {
  final String baseCurrency;

  const LoadExchangeRates(this.baseCurrency);

  @override
  List<Object> get props => [baseCurrency];
}

class ChangeBaseCurrency extends CurrencyEvent {
  final String newCurrency;

  const ChangeBaseCurrency(this.newCurrency);

  @override
  List<Object> get props => [newCurrency];
}