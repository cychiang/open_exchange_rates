import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';
import 'package:http/http.dart' as http;

class Usage extends OxrBase {
  final String app_id;
  Usage(app_id) : app_id = app_id;

  Future<Map> Get({
    bool prettyprint,
  }) async {
    final http.Client client = http.Client();
    final _uri = usageTemplate.expand({
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
