import 'package:open_exchange_rates/src/api/oxr_latest.dart';
import 'package:open_exchange_rates/src/api/oxr_currencies.dart';
import 'package:open_exchange_rates/src/api/oxr_historical.dart';
import 'package:open_exchange_rates/src/api/oxr_timeseries.dart';
import 'package:open_exchange_rates/src/api/oxr_convert.dart';
import 'package:open_exchange_rates/src/api/oxr_ohlc.dart';
import 'package:open_exchange_rates/src/api/oxr_usage.dart';
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
  TimeSeries timeseries;
  Convert convert;
  Ohlc ohlc;
  Usage usage;
  New(String app_id) {
    latest = new Latest(app_id);
    historical = new Historical(app_id);
    timeseries = new TimeSeries(app_id);
    convert = new Convert(app_id);
    ohlc = new Ohlc(app_id);
    usage = new Usage(app_id);
    currencies = new Currencies();
  }
}

