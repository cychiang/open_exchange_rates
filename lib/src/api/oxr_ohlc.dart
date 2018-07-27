import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';
import 'package:http/http.dart' as http;

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
    final http.Client client = http.Client();
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
        .then((res) => json.decode(res.body))
        .whenComplete(() => client.close());
  }
}
