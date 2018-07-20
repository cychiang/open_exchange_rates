import 'oxr_latest.dart';
import 'oxr_currencies.dart';
import 'oxr_historical.dart';
// Define base units

class Currency {
  final String _currency_code;
  final String _currency_name;

  Currency(_currency_code, _currency_name)
      : _currency_code = _currency_code,
        _currency_name = _currency_name;
}

class Rate {
  final String _currency_code;
  final num _rate;

  Rate(_currency_code, _rate)
      : _currency_code = _currency_code,
        _rate = _rate;
}

class LatestResponse {
  final String _base;
  final List<Rate> _rates;

  LatestResponse(_base, _rates)
      : _base = _base,
        _rates = _rates;
}

class New {
  Latest latest;
  Currencies currencies;
  Historical historical;
  New(String app_id) {
    latest = new Latest(app_id);
    historical = new Historical(app_id);
    currencies = new Currencies();
  }
}

