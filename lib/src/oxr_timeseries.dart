import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';

// https://openexchangerates.org/api/time-series.json

class TimeSeries extends OxrBase {
  final String app_id;
  TimeSeries(app_id) : app_id = app_id;

  Future<String> Get({
    String start,
    String end,
    String symbols,
    String base,
    bool show_alternative,
    bool prettyprint,
  }) async {
    final _uri = timeseriesTemplate.expand({
      'start': start,
      'end': end,
      'symbols': symbols,
      'base': base,
      'app_id': this.app_id,
      'show_alternative': show_alternative,
      'prettyprint': prettyprint,
    });
    print(_uri);
    String result;
    await client
        .get(_uri)
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => result = json.toString());
    return result;
  }
}

// {?app_id,start,end,symbols,base,show_alternative,prettyprint}