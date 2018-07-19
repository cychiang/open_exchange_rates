import 'oxr_latest.dart';

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
  final String app_id;
  Latest latest;
  New(app_id) : app_id = app_id;
}
