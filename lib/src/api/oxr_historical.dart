import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'oxr_base.dart';

class Historical extends OxrBase {
  final String app_id;
  Historical(app_id) : app_id = app_id;

  Future<Map> Get(
      {String date,
      String base,
      String symbols,
      bool show_alternative,
      bool prettyprint}) async {
    final http.Client client = http.Client();
    final _uri = historicalTemplate.expand({
      'date': date,
      'app_id': this.app_id,
      'base': base,
      'symbols': symbols,
      'show_alternative': show_alternative,
      'prettyprint': prettyprint,
    });
    // TODO: handle Error
    return await client
        .get(_uri)
        .then((res) => json.decode(res.body))
        .catchError((e) => print(e))
        .whenComplete(() => client.close());
  }
}
