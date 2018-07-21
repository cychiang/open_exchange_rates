import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';

/// https://openexchangerates.org/api/ohlc.json
/// Get historical Open, High Low, Close (OHLC) and Average exchange rates for a given time period, ranging from 1 month to 1 minute, where available. Please read all the details before starting integration.
///
/// Values for 'high', 'low' and 'average' are based on all recorded prices we published (up to every 1 second).
///
/// OHLC requests are currently available for clients of our VIP Platinum tier.
///

class Ohlc extends OxrBase {
  final String app_id;
  Ohlc(app_id) : app_id = app_id;

  Future<Map> Get({
    String start_time,
    String period,
    String symbols,
    String base,
    bool prettyprint,
  }) async {
    final _uri = ohlcTemplate.expand({
      'start_time': start_time,
      'period': period,
      'symbols': symbols,
      'base': base,
      'app_id': this.app_id,
      'prettyprint': prettyprint,
    });
    return await client
        .get(_uri)
        .then((res) => json.decode(res.body));
  }
}

// start_time: Format: "YYYY-MM-DDThh:mm:00Z".
// {?app_id,start_time,period,symbols,base,prettyprint}
// 1m, 5m, 15m, 30m, 1h, 12h, 1d, 1w, and 1mo