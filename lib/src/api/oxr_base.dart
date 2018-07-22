import 'package:uri/uri.dart';

class OxrBase {
  var latestTemplate = new UriTemplate(
      "https://openexchangerates.org/api/latest.json{?app_id,base,symbols,prettyprint,show_alternative}");
  var currenciesTemplate = new UriTemplate(
      "https://openexchangerates.org/api/currencies.json{?prettyprint,show_alternative,show_inactive}");
  var historicalTemplate = new UriTemplate(
      "https://openexchangerates.org/api/historical/{date}.json{?app_id,base,symbols,show_alternative,prettyprint}");
  var timeseriesTemplate = new UriTemplate(
      "https://openexchangerates.org/api/time-series.json{?app_id,start,end,symbols,base,show_alternative,prettyprint}");
  var convertTemplate = new UriTemplate(
      "https://openexchangerates.org/api/convert/{value}/{from}/{to}{?app_id,prettyprint}");
  var ohlcTemplate = new UriTemplate(
      "https://openexchangerates.org/api/ohlc.json{?app_id,start_time,period,symbols,base,prettyprint}");
  var usageTemplate = new UriTemplate(
      "https://openexchangerates.org/api/usage.json{?app_id,prettyprint}");
}
