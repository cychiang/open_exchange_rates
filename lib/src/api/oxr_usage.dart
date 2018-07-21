import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';
// https://openexchangerates.org/api/usage.json

class Usage extends OxrBase {
  final String app_id;
  Usage(app_id) : app_id = app_id;

  Future<Map> Get({
    bool prettyprint,
  }) async {
    final _uri = usageTemplate.expand({
      'app_id': this.app_id,
      'prettyprint': prettyprint,
    });
    return await client
        .get(_uri)
        .then((res) => json.decode(res.body));
  }
}
