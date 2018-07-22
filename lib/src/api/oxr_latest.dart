import 'dart:async';
import 'dart:convert';
import 'oxr_base.dart';
import 'package:http/http.dart' as http;

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

  Future<Map> Get(
      {String base,
      String symbols,
      bool prettyprint,
      bool show_alternative}) async {
    final http.Client client = http.Client();
    final _uri = latestTemplate.expand({
      'app_id': this.app_id,
      'base': base,
      'symbols': symbols,
      'prettyprint': prettyprint,
      'show_alternative': show_alternative,
    });
    return await client.get(_uri).then((res) => json.decode(res.body)).whenComplete(() => client.close());
  }
}
