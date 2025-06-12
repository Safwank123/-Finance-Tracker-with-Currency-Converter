
import 'package:finance_tracker_with_currency_converter/models/currency_rate.dart';

import 'api_client.dart';

class CurrencyRepository {
  final ApiClient _apiClient = ApiClient();

  Future<CurrencyRate> fetchExchangeRates(String baseCurrency) async {
    final data = await _apiClient.getExchangeRates(baseCurrency);
    return CurrencyRate.fromJson(data);
  }
}