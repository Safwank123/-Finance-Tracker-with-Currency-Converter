import 'package:equatable/equatable.dart';

class CurrencyRate extends Equatable {
  final String baseCode;
  final Map<String, double> conversionRates;
  final DateTime timeLastUpdate;

  const CurrencyRate({
    required this.baseCode,
    required this.conversionRates,
    required this.timeLastUpdate,
  });

  factory CurrencyRate.fromJson(Map<String, dynamic> json) {
    return CurrencyRate(
      baseCode: json['base_code'],
      conversionRates: Map<String, double>.from(json['conversion_rates']),
      timeLastUpdate: DateTime.parse(json['time_last_update_utc']),
    );
  }

  @override
  List<Object> get props => [baseCode, conversionRates, timeLastUpdate];
}