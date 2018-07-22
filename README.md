# open_exchange_rates
The [open_exchange_rates](https://openexchangerates.org) library is a dartlang wrapping and make it easy to use.

## It's still under development

Any suggestions are welcome.

## How to use?
1. Registry and get an app key from [open_exchange_rates](https://openexchangerates.org)
2. Example Code Here: 
```dart
import 'package:open_exchange_rates/open_exchange_rates.dart' as Oxr;

void main(List<String> args) async {
  Oxr.New oxr = new Oxr.New(args[0]);
  var response_latest = await oxr.latest.Get();
  var response_currencies = await oxr.currencies.Get();
  var response_historical = await oxr.historical.Get(date: '2018-07-01');
  print(response_latest);
  print(response_currencies);
  print(response_historical);
}
```
## Run example
```dart
dart example/main.dart ${api_key}
```