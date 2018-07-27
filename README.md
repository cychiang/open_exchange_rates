# open_exchange_rates
The [open_exchange_rates](https://openexchangerates.org) library is a dartlang wrapping and make it easy to use.

[![pub package](https://img.shields.io/pub/v/open_exchange_rates.svg)](https://pub.dartlang.org/packages/open_exchange_rates)

## How to use?
1. Registry and get an app key from [open_exchange_rates](https://openexchangerates.org)
2. Example Code Here: 
```dart
import 'package:open_exchange_rates/open_exchange_rates.dart' as Oxr;

void main(List<String> args) async {
  Oxr.New oxr = new Oxr.New(args[0]);
  var latest = await oxr.latest.Get(base: 'TWD', symbols: 'JPY,USD,SEK,GBP');
  var currencies = await oxr.currencies.Get();
  var historical = await oxr.historical
      .Get(date: '2018-07-01', base: 'TWD', symbols: 'JPY,USD,SEK,GBP');
  var timeseries = await oxr.timeseries.Get(
      start: '2018-07-01',
      end: '2018-07-14',
      base: 'TWD',
      symbols: 'JPY,USD,SEK,GBP');
  var convert = await oxr.convert.Get(value: '100', from: 'TWD', to: 'USD');
  var ohlc =
      await oxr.ohlc.Get(start_time: '2018-07-01T00:00:00Z', period: '1mo');
  var usage = await oxr.usage.Get();

  print(latest);
  print(currencies);
  print(historical);
  print(timeseries);
  print(convert);
  print(ohlc);
  print(usage);
}
```
## Run example
```
dart example/main.dart ${api_key}
```