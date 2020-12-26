import 'dart:io';

import 'package:open_exchange_rates/open_exchange_rates.dart';

void main(List<String> args) async {
  var envVars = Platform.environment;
  var oxrApiKey = envVars['OXR_API_KEY'];
  var oxr = Oxr(apiKey: oxrApiKey);

  var latest = await oxr.getLatest(prettyPrint: true);
  latest.rates.forEach((key, value) {
    print('${key}: ${value}');
  });

  // Oxr.New oxr = new Oxr.New(args[0]);
  // var latest = await oxr.latest.Get(base: 'TWD', symbols: 'JPY,USD,SEK,GBP');
  // var currencies = await oxr.currencies.Get();
  // var historical = await oxr.historical
  //     .Get(date: '2018-07-01', base: 'TWD', symbols: 'JPY,USD,SEK,GBP');
  // var timeseries = await oxr.timeseries.Get(
  //     start: '2018-07-01',
  //     end: '2018-07-14',
  //     base: 'TWD',
  //     symbols: 'JPY,USD,SEK,GBP');
  // var convert = await oxr.convert.Get(value: '100', from: 'TWD', to: 'USD');
  // var ohlc =
  //     await oxr.ohlc.Get(start_time: '2018-07-01T00:00:00Z', period: '1mo');
  // var usage = await oxr.usage.Get();
  //
  // print(latest);
  // print(currencies);
  // print(historical);
  // print(timeseries);
  // print(convert);
  // print(ohlc);
  // print(usage);
}
