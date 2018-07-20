import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';

class Currencies extends OxrBase {
  Future<String> Get(
      {bool prettyprint, bool show_alternative, bool show_inactive}) async {
    final _uri = currenciesTemplate.expand({
      'prettyprint': prettyprint,
      'show_alternative': show_alternative,
      'show_inactive': show_inactive,
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
