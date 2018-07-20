import 'package:open_exchange_rates/open_exchange_rates.dart' as Oxr;

void main() async {
  Oxr.New oxr = new Oxr.New('api_key');
//  var response_latest = await oxr.latest.Get();
//  var response_currencies = await oxr.currencies.Get();
  var response_historical = await oxr.historical.Get(
      date: '2018-07-01');
//  print(response_latest);
//  print(response_currencies);
  print(response_historical);
}
