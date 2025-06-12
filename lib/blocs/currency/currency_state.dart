part of 'currency_bloc.dart';

enum CurrencyStatus { initial, loading, success, failure }

class CurrencyState extends Equatable {
  final CurrencyStatus status;
  final CurrencyRate? rates;
  final String baseCurrency;
  final String? error;

  const CurrencyState({
    this.status = CurrencyStatus.initial,
    this.rates,
    this.baseCurrency = 'USD',
    this.error,
  });

 
  CurrencyState copyWith({
    CurrencyStatus? status,
    CurrencyRate? rates,
    String? baseCurrency,
    String? error,
  }) {
    return CurrencyState(
      status: status ?? this.status,
      rates: rates ?? this.rates,
      baseCurrency: baseCurrency ?? this.baseCurrency,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, rates, baseCurrency, error];
}