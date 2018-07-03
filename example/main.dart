import 'package:open_exchange_rates/oer.dart';

// example code
main() async {
  String api_key = 'api_key';
//  ExchangerBloc blocLatest = ExchangerBloc.fromLatest(Latest());
//  ExchangerBloc blocCurrencies = ExchangerBloc.fromCurrencies(Currencies());
  ExchangerBloc blocHistorical = ExchangerBloc.fromHistorical(Historical());
  // Latest
//  blocLatest.query.add(Params(api_key: api_key));
//  blocLatest.results.forEach((item) => item.forEach((val) =>
//      print('${val.currency}: ${val.ratio}')
//  ));
  // Currencies
//  blocCurrencies.query.add(Params(api_key: api_key));
//  blocCurrencies.currency.forEach((item) => item.forEach((val) =>
//      print('${val.currency}: ${val.name}')
//  ));
  // Historical
  blocHistorical.query.add(Params(api_key: api_key, date: '2018-07-01'));
  blocHistorical.history.forEach((item) => item.forEach((val) =>
      print('${val.currency}: ${val.ratio}')
  ));
//  blocLatest.dispose();
//  blocCurrencies.dispose();
  blocHistorical.dispose();
}
