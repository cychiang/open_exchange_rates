import 'package:open_exchange_rates/open_exchange_rates.dart';

// example code
main() async {
  String api_key = 'api_key';
  ExchangerBloc blocLatest = ExchangerBloc.fromLatest(Latest());
  ExchangerBloc blocCurrencies = ExchangerBloc.fromCurrencies(Currencies());
  // Latest
  blocLatest.query.add(Params(api_key: api_key));
  blocLatest.results.forEach((item) => item.forEach((val) =>
      print('${val.currency}: ${val.ratio}')
  ));
  // Latest
  blocCurrencies.query.add(Params(api_key: api_key));
  blocCurrencies.currency.forEach((item) => item.forEach((val) =>
      print('${val.currency}: ${val.name}')
  ));

  blocLatest.dispose();
  blocCurrencies.dispose();
}
