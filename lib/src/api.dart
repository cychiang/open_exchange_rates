import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';
import 'rate.dart';
import 'params.dart';

class API {
  final http.Client _client = http.Client();
  final UriTemplate _url = UriTemplate(
      'https://openexchangerates.org/api/latest.json'
      '?app_id={api_key}'
  );
  Future<List<Rate>> get(Params query) async {
    List<Rate> list = [];
    // Format Uri
    String _compose_url = _url.expand({'api_key': query.api_key});
    if (query.base != null) {
      _compose_url += '?base=${query.base}';
    }
    if (query.symbols != null) {
      _compose_url += '?symbols=${query.symbols}';
    }
    if (query.prettyprint != null) {
      _compose_url += '?symbols=${query.prettyprint}';
    }
    if (query.show_alternative != null) {
      _compose_url += '?symbols=${query.show_alternative}';
    }
    await _client
        .get(_compose_url)
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json['rates'])
        .then((rates) => rates.forEach((key, value)
    => list.add(Rate.fromMap(key, value))));
    return list;
  }
}