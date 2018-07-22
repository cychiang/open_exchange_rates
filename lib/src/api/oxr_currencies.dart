import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';

class Currencies extends OxrBase {
  Future<Map> Get(
      {bool prettyprint, bool show_alternative, bool show_inactive}) async {
    final _uri = currenciesTemplate.expand({
      'prettyprint': prettyprint,
      'show_alternative': show_alternative,
      'show_inactive': show_inactive,
    });
    return await client.get(_uri).then((res) => json.decode(res.body)).whenComplete(() => client.close());
  }
}
