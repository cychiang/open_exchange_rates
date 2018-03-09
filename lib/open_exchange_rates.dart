import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

// create class to handle requests
class OpenExchangeRates {
  // init variable
  static const base_path = 'https://openexchangerates.org/api/';
  // OpenExchangeRatesOptions opts;
  String query = null;
  String api_key = null;
  // Query options
  String base = null;
  String symbols = null;
  bool show_alternative = null;
  bool prettyprint = null;
  // each api has its own init function
  OpenExchangeRates.initLatest(){
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
    // TODO: 
  }
  OpenExchangeRates.initHistorical(){}
  OpenExchangeRates.initCurrencies(){}
  OpenExchangeRates.initTimeseries(){}
  OpenExchangeRates.initConvert(){}
  OpenExchangeRates.initOhlc(){}
  OpenExchangeRates.initUsage(){}
  get() => http.get(base_path + this.query);
}

main() async {
  String api_key = Platform.environment['OER_API_KEY'];
  // How to use
  // Get query instance at initial time
  OpenExchangeRates queryLatest = new OpenExchangeRates.initLatest();
  // Use get function to perform query and get result
  var latestResponse = await queryLatest.get();
  print('${latestResponse}');
}
