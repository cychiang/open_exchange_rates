import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';
// https://openexchangerates.org/api/convert/:value/:from/:to

class Convert extends OxrBase {
  final String app_id;
  Convert(app_id) : app_id = app_id;

  Future<Map> Get({
    String value,
    String from,
    String to,
    bool prettyprint,
  }) async {
    final _uri = convertTemplate.expand({
      'value': value,
      'from': from,
      'to': to,
      'app_id': this.app_id,
      'prettyprint': prettyprint,
    });
    return await client
        .get(_uri)
        .then((res) => json.decode(res.body));
  }
}
