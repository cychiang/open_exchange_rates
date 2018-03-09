import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

class OpenExchangeRatesBase {
  final String base_path = 'https://openexchangerates.org/api/';
  String api_key = null;
  // init api_key from environment variable
  OpenExchangeRatesBase() {
    this.api_key = Platform.environment['OER_API_KEY'];
  }
}
// create class to handle requests
class OpenExchangeRates extends OpenExchangeRatesBase{
  // init variable
  String query = null;
  // Query options
  String base = null;
  String symbols = null;
  bool show_alternative = null;
  bool prettyprint = null;
  // each api has its own init function
  OpenExchangeRates.initLatest({
    this.base, this.symbols, 
    this.show_alternative, this.prettyprint}){
    this.query = this.base_path + 'latest.json?app_id=${this.api_key}';
    if (this.base != null) {
      // base: Change base currency (3-letter code, default: USD)
      this.query = this.query + '&base=${this.base}';
    }
    if (this.symbols != null) {
      // symbols: Limit results to specific currencies (comma-separated list of 3-letter codes)
      this.query = this.query + '&symbols=${this.symbols}';
    }
    if (this.show_alternative != null) {
      // show_alternative: Extend returned values with alternative, black market and digital currency rates
      this.query = this.query + '&symbols=${this.show_alternative}';
    }
    if (this.prettyprint != null) {
      // prettyprint: Human-readable response for debugging (response size will be much larger)
      this.query = this.query + '&symbols=${this.prettyprint}';
    }
    print(this.query);
  }
  OpenExchangeRates.initHistorical(){}
  OpenExchangeRates.initCurrencies(){}
  OpenExchangeRates.initTimeseries(){}
  OpenExchangeRates.initConvert(){}
  OpenExchangeRates.initOhlc(){}
  OpenExchangeRates.initUsage(){}
  get() => http.get(this.query);
}

main() async {
  // Get query instance at initial time
  OpenExchangeRates queryLatest = new OpenExchangeRates.initLatest();
  var latestResponse = await queryLatest.get();
  print('${latestResponse.body}');
}
