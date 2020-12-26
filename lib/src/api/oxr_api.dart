import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';

import '../oxr.dart';

class Oxr {
  static const defaultApiEndpoint = 'https://openexchangerates.org/api';
  String apiKey;
  Map<String, String> headers;
  Oxr({this.apiKey}) {
    headers = {
      'Authorization': 'Token ${apiKey}',
      'User-Agent': 'oxr-sdk-dart/${version}',
      'Content-Type': 'application/json',
    };
  }
  Future<Latest> getLatest(
      {String base,
      String symbols,
      bool prettyPrint,
      bool showAlternative}) async {
    Latest latest;
    var queryParams = QueryParams(
        base: base,
        symbols: symbols,
        prettyPrint: prettyPrint,
        showAlternative: showAlternative);
    var uri = UriTemplate(defaultApiEndpoint +
            '/latest.json{?base,symbols,prettyprint,show_alternative}')
        .expand(queryParams.toJson());
    var response = await _get(uri);
    if (response.statusCode == HttpStatus.ok) {
      latest = Latest.fromJson(jsonDecode(response.body));
    }
    return latest;
  }

  Future<http.Response> _get(String url) async {
    print('url: ${url}');
    http.Response response = await http.get(url, headers: headers);
    return response;
  }
}
