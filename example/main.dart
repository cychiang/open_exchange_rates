import 'dart:io';

import 'package:open_exchange_rates/open_exchange_rates.dart';

void main(List<String> args) async {
  var envVars = Platform.environment;
  var oxrApiKey = envVars['OXR_API_KEY'];
  var oxr = Oxr(apiKey: oxrApiKey);

  var latest = await oxr.getLatest();
  if (latest != null) {
    latest.rates.forEach((key, value) {
      print('${key}: ${value}');
    });
  }
  var historical = await oxr.getHistorical(DateTime(2020, 12, 1));
  if (historical != null) {
    historical.rates.forEach((key, value) {
      print('${key}: ${value}');
    });
  }
}
