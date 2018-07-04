import 'package:http/http.dart' as http;

import 'params.dart';

class APIBase {
  final http.Client client = http.Client();

  String init_query(Params params) {
    String _query = '';
    if (params.date != null) {
      _query += '${params.date}.json';
    }
    if (params.api_key != null) {
      _query += '?app_id=${params.api_key}';
    }
    if (params.base != null) {
      _query += '?base=${params.base}';
    }
    if (params.symbols != null) {
      _query += '?symbols=${params.symbols}';
    }
    if (params.prettyprint != null) {
      _query += '?prettyprint=${params.prettyprint}';
    }
    if (params.show_alternative != null) {
      _query += '?show_alternative=${params.show_alternative}';
    }
    if (params.show_inactive != null) {
      _query += '?show_inactive=${params.show_inactive}';
    }
    return _query;
  }
}
