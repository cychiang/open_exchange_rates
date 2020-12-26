import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'oxr_base.dart';

class Convert extends OxrBase {
  final String app_id;
  Convert(app_id) : app_id = app_id;

  Future<Map> Get({
    String value,
    String from,
    String to,
    bool prettyprint,
  }) async {
    final http.Client client = http.Client();
    final _uri = convertTemplate.expand({
      'value': value,
      'from': from,
      'to': to,
      'app_id': this.app_id,
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
