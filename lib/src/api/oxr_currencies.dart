import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';
import 'package:http/http.dart' as http;

class Currencies extends OxrBase {
  Future<Map> Get(
      {bool prettyprint, bool show_alternative, bool show_inactive}) async {
    final http.Client client = http.Client();
    final _uri = currenciesTemplate.expand({
      'prettyprint': prettyprint,
      'show_alternative': show_alternative,
      'show_inactive': show_inactive,
    });
    return await client.get(_uri).then((res) => json.decode(res.body)).whenComplete(() => client.close());
  }
}
