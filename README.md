# open_exchange_rates
The [open_exchange_rates](https://openexchangerates.org) library is a dartlang wrapping and make it easy to use.

## It's still under development

Any suggestions are welcome.

## How to use?
1. Registry and get an app key from [open_exchange_rates](https://openexchangerates.org)
2. Example Code Here:
##
    import 'package:open_exchange_rates/open_exchange_rates.dart';
    
    // example code
    main() async {
      String api_key = 'your_api_key_from_openexchange';
      ExchangerBloc blocLatest = ExchangerBloc.fromLatest(Latest());
      ExchangerBloc blocCurrencies = ExchangerBloc.fromCurrencies(Currencies());
      // Get Latest
      blocLatest.query.add(Params(api_key: api_key));
      blocLatest.results.forEach((item) => item.forEach((val) =>
          print('${val.currency}: ${val.ratio}')
      ));
      // Get Currencies
      blocCurrencies.query.add(Params(api_key: api_key));
      blocCurrencies.currency.forEach((item) => item.forEach((val) =>
          print('${val.currency}: ${val.name}')
      ));
      blocLatest.dispose();
      blocCurrencies.dispose();
    }


