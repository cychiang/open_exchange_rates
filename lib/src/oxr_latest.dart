import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';

/// https://openexchangerates.org/api/latest.json
/// app_id:	string Required
/// Your unique App ID
///
/// base:	string Optional
/// Change base currency (3-letter code, default: USD)
///
/// symbols:	string Optional
/// Limit results to specific currencies (comma-separated list of 3-letter codes)
///
/// prettyprint:	boolean Optional
/// Set to false to reduce response size (removes whitespace)
///
/// show_alternative:	boolean Optional
/// Extend returned values with alternative, black market and digital currency rates

class Latest extends OxrBase {
  final String app_id;
  Latest(app_id) : app_id = app_id;

  Future<String> Get(
      {String base,
      String symbols,
      bool prettyprint,
      bool show_alternative}) async {
    final _uri = latestTemplate.expand({
      'app_id': this.app_id,
      'base': base,
      'symbols': symbols,
      'prettyprint': prettyprint,
      'show_alternative': show_alternative,
    });
    print(_uri);
    String result;
    await client
        .get(_uri)
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => result = json.toString());
    return result;

//    .get(url)
//        .then((res) => res.body)
//        .then(json.decode)
//        .then((json) => json['rates'])
//        .then((rates) =>
//    rates.forEach((key, value) => list.add(Rate.fromMap(key, value))));
  }
}
