import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

// Copy from api document from openexchangerates.org
// Parameters
// - app_id: string(Must)
// - base: string(Optional)
//   - Change base currency (3-letter code, default: USD)
// - symbols: string(Optional)
//   - Limit results to specific currencies (comma-separated list of 3-letter codes)
// - show_alternative: boolean(Optional)
//   - Extend returned values with alternative, black market and digital currency rates
// - prettyprint:	boolean(Optional)
//   - Human-readable response for debugging (response size will be much larger)

class OpenExchangeRatesOptions {
  String base = null;
  String symbols = null;
  bool show_alternative = null;
  bool prettyprint = null;
  // init options
  OpenExchangeRatesOptions() {}
  String get() {
    return 'query_string';
  }
}

// create class to handle requests
class OpenExchangeRates {
  // init variable
  static const base_path = 'https://openexchangerates.org/api/';
  OpenExchangeRatesOptions opts;
  String api_key = null;
  // create constructer
  OpenExchangeRates(OpenExchangeRatesOptions opts, String api_key) {
    this.opts = opts;
    this.api_key = api_key;
  }
  // get latest 
  latest(){
    // compose query string

    return http.get(
      base_path + '/latest.json?app_id=' + api_key
    );
  }
  historical(){
    // 
    return http.get(
      '/historical/*.json'
    );
  }
  currencies(){
    //
    return http.get(
      '/currencies.json'
    );
  }
  timeseries(){
    // 
    return http.get(
      '/time-series.json'
    );
  }
  convert(){
    // 
    return http.get(
      '/convert'
    );
  }
  ohlc(){
    // 
    return http.get(
      '/ohlc.json'
    );
  }
  usage(){
    // 
    return http.get(
      '/usage.json'
    );
  }
}

main() async {
  String api_key = Platform.environment['OER_API_KEY'];
  OpenExchangeRatesOptions opts = new OpenExchangeRatesOptions();
  var oer_client = new OpenExchangeRates(opts, api_key);
  var response = await oer_client.latest();
  print('${response.body}');
}
