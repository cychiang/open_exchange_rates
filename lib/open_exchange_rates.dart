import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

// create class to handle requests
class OpenExchangeRates {
  // init variable
  static const base_path = 'https://openexchangerates.org/api/';
  String api_key = null;
  // create constructer
  OpenExchangeRates(String api_key) {
    this.api_key = api_key;
  }
  // get latest 
  latest(){
    // 
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
  var oer_client = new OpenExchangeRates(api_key);
  var response = await oer_client.latest();
  print('${response.body}');
}
