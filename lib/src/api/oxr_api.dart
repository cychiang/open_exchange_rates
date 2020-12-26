import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:uri/uri.dart';

import '../oxr.dart';

class Oxr {
  static const defaultApiEndpoint = 'https://openexchangerates.org';
  final dateFormatter = DateFormat('yyyy-MM-dd');
  String apiKey;
  String endpoint;
  Map<String, String> headers;
  QueryParams getParams(
          {String base,
          String symbols,
          bool prettyPrint,
          bool showAlternative,
          bool showInactive}) =>
      QueryParams(
          base: base,
          symbols: symbols,
          prettyPrint: prettyPrint,
          showAlternative: showAlternative,
          showInactive: showInactive);

  Oxr(String apiKey, {String endpoint})
      : endpoint = endpoint ?? defaultApiEndpoint {
    headers = {
      'Authorization': 'Token ${apiKey}',
      'User-Agent': 'oxr-sdk-dart/${version}',
      'Content-Type': 'application/json',
    };
  }
  Future<Rates> getLatest(
      {String base,
      String symbols,
      bool prettyPrint,
      bool showAlternative}) async {
    Rates latest;
    var uri = UriTemplate(endpoint +
        '/api/latest.json{?base,symbols,prettyprint,show_alternative}');
    var response = await _get(
        uri,
        getParams(
                base: base,
                symbols: symbols,
                prettyPrint: prettyPrint,
                showAlternative: showAlternative)
            .toJson());
    if (response.statusCode == HttpStatus.ok) {
      latest = Rates.fromJson(jsonDecode(response.body));
    }
    return latest;
  }

  Future<Rates> getHistorical(DateTime date,
      {String base,
      String symbols,
      bool prettyPrint,
      bool showAlternative}) async {
    Rates historical;
    var uri = UriTemplate(endpoint +
        '/api/historical/${dateFormatter.format(date)}' +
        '.json{?base,symbols,prettyprint,show_alternative}');
    var response = await _get(
        uri,
        getParams(
                base: base,
                symbols: symbols,
                prettyPrint: prettyPrint,
                showAlternative: showAlternative)
            .toJson());
    if (response.statusCode == HttpStatus.ok) {
      historical = Rates.fromJson(jsonDecode(response.body));
    }
    return historical;
  }

  Future<Map<String, dynamic>> getCurrencies(
      {bool prettyPrint, bool showAlternative, bool showInactive}) async {
    var currencies;
    var uri = UriTemplate(endpoint +
        '/api/currencies.json{?prettyprint,show_alternative,show_inactive}');
    var response = await _get(
        uri,
        getParams(
                prettyPrint: prettyPrint,
                showAlternative: showAlternative,
                showInactive: showInactive)
            .toJson());
    if (response.statusCode == HttpStatus.ok) {
      currencies = jsonDecode(response.body);
    }
    return currencies;
  }

  Future<http.Response> _get(
      UriTemplate uriTemplate, Map<String, dynamic> queryParams) async {
    http.Response response =
        await http.get(uriTemplate.expand(queryParams), headers: headers);
    return response;
  }
}
