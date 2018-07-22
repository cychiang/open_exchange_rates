import 'package:open_exchange_rates/src/api/oxr_latest.dart';
import 'package:open_exchange_rates/src/api/oxr_currencies.dart';
import 'package:open_exchange_rates/src/api/oxr_historical.dart';
import 'package:open_exchange_rates/src/api/oxr_timeseries.dart';
import 'package:open_exchange_rates/src/api/oxr_convert.dart';
import 'package:open_exchange_rates/src/api/oxr_ohlc.dart';
import 'package:open_exchange_rates/src/api/oxr_usage.dart';

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
