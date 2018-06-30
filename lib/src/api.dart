import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';
import 'rate.dart';
import 'params.dart';

class API {
  final http.Client _client = http.Client();
  final UriTemplate _url = UriTemplate(
      'https://openexchangerates.org/api/latest.json' +
      '?app_id={api_key}' +
      '?base={base}' +
      '?symbols={symbols}' +
      '?prettyprint={pretty_print}' +
      '?show_alternative={show_alternative}'
  );

  Future<List<Rate>> get(Params query) async {
    List<Rate> list = [];
    await _client
        .get(_url.expand({
          'api_key': query.api_key,
          'base': query.base,
          'symbols': query.symbols,
          'pretty_print': query.pretty_print,
          'show_alternative': query.show_alternative
        }))
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json['rates'])
        .then((rates) => rates.forEach((key, value)
    => list.add(Rate.fromMap(key, value))));
    return list;
  }
}