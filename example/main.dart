import 'package:open_exchange_rates/oer.dart';

// example code
main() async {
  String api_key = 'api_key';
  // Query Latest
  QueryLatest latest = QueryLatest.get();
  latest.query.add(Params(api_key: api_key));
  latest.results.forEach(
      (item) => item.forEach((val) => print('${val.currency}: ${val.ratio}')));
  latest.dispose();
  // Query Currencies
  QueryCurrencies currencies = QueryCurrencies.get();
  currencies.query.add(Params(api_key: api_key));
  currencies.results.forEach(
      (item) => item.forEach((val) => print('${val.currency}: ${val.name}')));
  currencies.dispose();
  // Query Historical
  QueryHistorical historical = QueryHistorical.get();
  historical.query.add(Params(api_key: api_key, date: '2018-07-01'));
  historical.results.forEach(
      (item) => item.forEach((val) => print('${val.currency}: ${val.ratio}')));

  historical.dispose();
}
