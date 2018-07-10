import 'package:open_exchange_rates/open_exchange_rates.dart';

// example code

void runLatest(String api_key) async {
  QueryLatest latest = QueryLatest.get();
  latest.query.add(Params(api_key: api_key, symbols: "TWD,JPY"));
  // Query Latest
  await for (List<Rate> _rates in latest.results) {
    for (Rate rate in _rates) {
      if (rate.currency == "null") break;
      print('${rate.currency}: ${rate.ratio}');
    }
    break;
  }
}

void runHistorical(String api_key) async {
  QueryHistorical historical = QueryHistorical.get();
  historical.query.add(Params(api_key: api_key, date: '2018-07-01'));
  // Query Historical
  await for (List<Rate> _rates in historical.results) {
    for (Rate rate in _rates) {
      if (rate.currency == "null") break;
      print('${rate.currency}: ${rate.ratio}');
    }
    break;
  }
}

void runCurrencies(String api_key) async {
  QueryCurrencies currencies = QueryCurrencies.get();
  currencies.query.add(Params(api_key: api_key));
  // Query Currencies
  await for (List<Currency> _currencies in currencies.results) {
    for (Currency _currency in _currencies) {
      if (_currency.currency == "null") break;
      print('${_currency.currency}: ${_currency.name}');
    }
    break;
  }
}

main() async {
  String api_key = 'api_key';
  runLatest(api_key);
//  runHistorical(api_key);
//  runCurrencies(api_key);
}
