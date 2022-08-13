import 'dart:io';

import 'package:open_exchange_rates/open_exchange_rates.dart';

void main(List<String> args) async {
  String? apiKey = args.isNotEmpty ? args[0] : Platform.environment['OXR_API_KEY'];

  if (apiKey == null) {
    throw Exception('Empty API key');
  }

  var oxr = Oxr(apiKey);

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
