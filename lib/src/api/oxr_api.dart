import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:uri/uri.dart';

import '../oxr.dart';

class Oxr {
  static const defaultApiEndpoint = 'https://openexchangerates.org/api';
  String apiKey;
  final dateFormatter = DateFormat('yyyy-MM-dd');
  Map<String, String> headers;
  QueryParams getParams(
          {String base,
          String symbols,
          bool prettyPrint,
          bool showAlternative}) =>
      QueryParams(
          base: base,
          symbols: symbols,
          prettyPrint: prettyPrint,
          showAlternative: showAlternative);

  Oxr({this.apiKey}) {
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
    var uri = UriTemplate(defaultApiEndpoint +
            '/latest.json{?base,symbols,prettyprint,show_alternative}')
        .expand(getParams(
                base: base,
                symbols: symbols,
                prettyPrint: prettyPrint,
                showAlternative: showAlternative)
            .toJson());
    var response = await _get(uri);
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
    var uri = UriTemplate(defaultApiEndpoint +
            '/historical/${dateFormatter.format(date)}' +
            '.json{?base,symbols,prettyprint,show_alternative}')
        .expand(getParams(
                base: base,
                symbols: symbols,
                prettyPrint: prettyPrint,
                showAlternative: showAlternative)
            .toJson());
    var response = await _get(uri);
    if (response.statusCode == HttpStatus.ok) {
      historical = Rates.fromJson(jsonDecode(response.body));
    }
    return historical;
  }

  Future<http.Response> _get(String url) async {
    print('url: ${url}');
    http.Response response = await http.get(url, headers: headers);
    return response;
  }
}
