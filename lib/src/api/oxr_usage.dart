import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';
// https://openexchangerates.org/api/usage.json

class Usage extends OxrBase {
  final String app_id;
  Usage(app_id) : app_id = app_id;

  Future<String> Get({
    bool prettyprint,
  }) async {
    final _uri = usageTemplate.expand({
      'app_id': this.app_id,
      'prettyprint': prettyprint,
    });
    print(_uri);
    String result;
    await client
        .get(_uri)
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => result = json.toString());
    return result;
  }
}
