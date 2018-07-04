import 'dart:async';
import 'dart:convert';

//import 'package:uri/uri.dart';
import 'rate.dart';
import 'params.dart';
import 'api_base.dart';


class Historical extends APIBase {
  final String _url = 'https://openexchangerates.org/api/historical/';
  Future<List<Rate>> get(Params params) async {
    List<Rate> list = [];
    // Format Uri
    String url = _url + init_query(params);
    await client
        .get(url)
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json['rates'])
        .then((rates) => rates.forEach((key, value)
    => list.add(Rate.fromMap(key, value))));
    return list;
  }
}

class Latest extends APIBase {
  final String _url = 'https://openexchangerates.org/api/latest.json';
  Future<List<Rate>> get(Params params) async {
    List<Rate> list = [];
    String url = _url + init_query(params);
    await client
        .get(url)
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
  Future<List<Currency>> get(Params params) async {
    List<Currency> list = [];
    String url = _url + init_query(params);
    await client
        .get(url)
        .then((res) => res.body)
        .then(json.decode)
        .then((rates) => rates.forEach((key, value)
    => list.add(Currency.fromMap(key, value))));
    return list;
  }
}