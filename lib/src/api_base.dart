import 'package:http/http.dart' as http;

import 'params.dart';

// TODO: Add check method for data type.
class APIBase {
  final http.Client client = http.Client();

  String init_query(Params params) {
    String _query = '';
    if (params.date != null) {
      _query += params.date.length == 0 ? '' : '${params.date}.json';
    }
    if (params.api_key != null) {
      _query += params.api_key.length == 0 ? '' : '?app_id=${params.api_key}';
    }
    if (params.base != null) {
      _query += params.base.length == 0 ? '' : '?base=${params.base}';
    }
    if (params.symbols != null) {
      _query += params.symbols.length == 0 ? '' : '?symbols=${params.symbols}';
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
