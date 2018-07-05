import 'package:open_exchange_rates/open_exchange_rates.dart';

// example code

void runLatest(String api_key) async {
  QueryLatest latest = QueryLatest.get();
  latest.query.add(Params(api_key: api_key));
  // Query Latest
  await for (List<Rate> _rates in latest.results) {
    for (Rate rate in _rates) {
      print('${rate.currency}: ${rate.ratio}');
    }
  }
}

void runHistorical(String api_key) async {
  QueryHistorical historical = QueryHistorical.get();
  historical.query.add(Params(api_key: api_key, date: '2018-07-01'));
  // Query Historical
  await for (List<Rate> _rates in historical.results) {
    for (Rate rate in _rates) {
      print('${rate.currency}: ${rate.ratio}');
    }
  }
}

void runCurrencies(String api_key) async {
  QueryCurrencies currencies = QueryCurrencies.get();
  currencies.query.add(Params(api_key: api_key));
  // Query Currencies
  await for (List<Currency> _currencies in currencies.results) {
    for (Currency _currency in _currencies) {
      print('${_currency.currency}: ${_currency.name}');
    }
  }
}

main() async {
  String api_key = 'api_key';
  runLatest(api_key);
  runHistorical(api_key);
  runCurrencies(api_key);
}
