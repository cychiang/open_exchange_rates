import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';

// https://openexchangerates.org/api/historical/2001-02-16.json?app_id=YOUR_APP_ID

class Historical extends OxrBase {
  final String app_id;
  Historical(app_id) : app_id = app_id;

  Future<String> Get(
      {String date,
      String base,
      String symbols,
      bool show_alternative,
      bool prettyprint}) async {
    final _uri = historicalTemplate.expand({
      'date': date,
      'app_id': this.app_id,
      'base': base,
      'symbols': symbols,
      'show_alternative': show_alternative,
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
