## open_exchange_rates
The [open_exchange_rates](https://openexchangerates.org) library helps you to use open exchange rates API much easier and simpler.
By providing your open exchange rates API key to the library and get data from the API in one line!

[![pub package](https://img.shields.io/pub/v/open_exchange_rates.svg)](https://pub.dartlang.org/packages/open_exchange_rates)

## Support methods
- [x] Get latest rates
- [x] Get historical rates

## How to use?
1. Registry and get an app key from [open_exchange_rates](https://openexchangerates.org)
2. Example Code Here: 
```dart
import 'dart:io';

import 'package:open_exchange_rates/open_exchange_rates.dart';

void main(List<String> args) async {
  var oxr = Oxr(Platform.environment['OXR_API_KEY']);

  var latest = await oxr.getLatest();
  if (latest != null) {
    latest.rates.forEach((key, value) {
      print('${key}: ${value}');
    });
  }
  var historical = await oxr.getHistorical(DateTime(2020, 12, 1));
  if (historical != null) {
    historical.rates.forEach((key, value) {
      print('${key}: ${value}');
    });
  }
}
```
## Run example
```bash
export OXR_API_KEY=${YOUR_API_KEY}
dart example/main.dart 
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][issue_tracker].

[issue_tracker]: https://github.com/cychiang/open_exchange_rates/issues
