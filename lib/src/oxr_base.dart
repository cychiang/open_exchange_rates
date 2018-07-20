import 'package:uri/uri.dart';
import 'package:http/http.dart' as http;

class OxrBase {
  final http.Client client = http.Client();
  var latestTemplate = new UriTemplate(
      "https://openexchangerates.org/api/latest.json{?app_id,base,symbols,prettyprint,show_alternative}");
  var currenciesTemplate = new UriTemplate(
      "https://openexchangerates.org/api/currencies.json{?prettyprint,show_alternative,show_inactive}");
  var historicalTemplate = new UriTemplate(
      "https://openexchangerates.org/api/historical/{date}.json{?app_id,base,symbols,show_alternative,prettyprint}");
}
