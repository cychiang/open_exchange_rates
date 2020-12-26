import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'oxr_base.dart';

class Currencies extends OxrBase {
  Future<Map> Get(
      {bool prettyprint, bool show_alternative, bool show_inactive}) async {
    final http.Client client = http.Client();
    final _uri = currenciesTemplate.expand({
      'prettyprint': prettyprint,
      'show_alternative': show_alternative,
      'show_inactive': show_inactive,
    });
    // TODO: handle Error
    return await client
        .get(_uri)
        .then((res) => json.decode(res.body))
        .catchError((e) => print(e))
        .whenComplete(() => client.close());
  }
}
