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
  bool show_inactive = null;
  // Path date for historical query
  String date = null;
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
      this.query = this.query + '&show_alternative=${this.show_alternative}';
    }
    if (this.prettyprint != null) {
      // prettyprint: Human-readable response for debugging (response size will be much larger)
      this.query = this.query + '&prettyprint=${this.prettyprint}';
    }
    // debug message
    print(this.query);
  }
  OpenExchangeRates.initHistorical({
    this.date, this.base, this.symbols, 
    this.show_alternative, this.prettyprint}){
    this.query = this.base_path + 'historical/${this.date}.json?app_id=${this.api_key}';
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
      this.query = this.query + '&show_alternative=${this.show_alternative}';
    }
    if (this.prettyprint != null) {
      // prettyprint: Human-readable response for debugging (response size will be much larger)
      this.query = this.query + '&prettyprint=${this.prettyprint}';
    }
    // debug message
    print(this.query);
  }
  OpenExchangeRates.initCurrencies({
    this.prettyprint, this.show_alternative, this.show_inactive}){
    this.query = this.base_path + 'currencies.json?app_id=';
    if (this.show_alternative != null) {
      // show_alternative: Extend returned values with alternative, black market and digital currency rates
      this.query = this.query + '&symbols=${this.show_alternative}';
    }
    if (this.prettyprint != null) {
      // prettyprint: Human-readable response for debugging (response size will be much larger)
      this.query = this.query + '&symbols=${this.prettyprint}';
    }
    if (this.show_inactive != null) {
      // show_inactive: Include historical/inactive currencies
      this.query = this.query + '&symbols=${this.show_inactive}';
    }
    // debug message
    print(this.query);
  }
  // time-series: enterprise and unlimited plan only
  OpenExchangeRates.initTimeseries(){}
  // unlimited plan only
  OpenExchangeRates.initConvert(){}
  // VIP Platinum only
  OpenExchangeRates.initOhlc(){}
  // 
  OpenExchangeRates.initUsage(
    {this.prettyprint}){
    this.query = this.base_path + 'usage.json?app_id=${this.api_key}';
    if (this.prettyprint != null) {
      // prettyprint: Human-readable response for debugging (response size will be much larger)
      this.query = this.query + '&symbols=${this.prettyprint}';
    }
    print(this.query); 
  }

  // perform http request
  // can improve something here
  get() => http.get(this.query);
  // update parameters to reuse get function
  update(){}
}

main() async {
  // Get query instance at initial time
  OpenExchangeRates queryLatest = new OpenExchangeRates.initLatest();
  OpenExchangeRates queryHistorical = new OpenExchangeRates.initHistorical(
    date: '2018-01-01');
  OpenExchangeRates queryCurrencies = new OpenExchangeRates.initCurrencies();
  OpenExchangeRates queryUsage = new OpenExchangeRates.initUsage();
  var latestResponse = await queryLatest.get();
  var historicalResponse = await queryHistorical.get();
  var currenciesResponse = await queryCurrencies.get();
  var usageResponse = await queryUsage.get();
  print('${latestResponse.body}');
  // print('${historicalResponse.body}');
  // print('${currenciesResponse.body}');
  // print('${usageResponse.body}');
}
