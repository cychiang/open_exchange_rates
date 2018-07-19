import 'dart:async';
import 'oxr_export.dart';
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
  Future<LatestResponse> Get(
      {String base,
      String symbols,
      bool prettyprint,
      bool show_alternative}) async {
    await client.get('');

    return null;
  }
}
