import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';
import 'rate.dart';
import 'params.dart';

class APIBase {
  final http.Client _client = http.Client();
}

class Historical extends APIBase {
  final UriTemplate _url = UriTemplate(
      'https://openexchangerates.org/api/historical/{date}.json?app_id={api_key}'
  );
  Future<List<Rate>> get(Params query) async {
    List<Rate> list = [];
    // Format Uri
    String _compose_url = _url.expand({
      'api_key': query.api_key,
      'date': query.date
    });
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

class Currencies extends APIBase {
  final String _url = 'https://openexchangerates.org/api/currencies.json';
  Future<List<Currency>> get(Params query) async {
    List<Currency> list = [];
    // Format Uri
    String _compose_url = _url;
    if (query.prettyprint != null) {
      _compose_url += '?symbols=${query.prettyprint}';
    }
    if (query.show_alternative != null) {
      _compose_url += '?symbols=${query.show_alternative}';
    }
    if (query.show_inactive != null) {
      _compose_url += '?show_inactive=${query.show_inactive}';
    }
    await _client
        .get(_compose_url)
        .then((res) => res.body)
        .then(json.decode)
        .then((rates) => rates.forEach((key, value)
    => list.add(Currency.fromMap(key, value))));
    return list;
  }
}

class Latest extends APIBase {
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