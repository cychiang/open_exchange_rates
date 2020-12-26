import 'dart:convert';
import 'dart:io';

import 'package:open_exchange_rates/open_exchange_rates.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:test/test.dart';

void main() {
  group('Test get user profile and followers', () {
    Oxr oxr;
    MockWebServer server;
    var dispatcher = (HttpRequest request) async {
      if (request.uri.path == '/api/latest.json') {
        return MockResponse()
          ..httpCode = HttpStatus.ok
          ..body = jsonEncode({
            'disclaimer': 'https://openexchangerates.org/terms/',
            'license': 'https://openexchangerates.org/license/',
            'timestamp': 1449877801,
            'base': 'USD',
            'rates': {'AED': 3.672538, 'AFN': 66.809999, 'ALL': 125.716501}
          });
      }
      if (request.uri.path == '/api/historical/2012-07-10.json') {
        return MockResponse()
          ..httpCode = HttpStatus.ok
          ..body = jsonEncode({
            'disclaimer': 'https://openexchangerates.org/terms/',
            'license': 'https://openexchangerates.org/license/',
            'timestamp': 1449877801,
            'base': 'USD',
            'rates': {'AED': 3.672914, 'AFN': 48.337601, 'ALL': 111.863334}
          });
      }
      if (request.uri.path == '/api/currencies.json') {
        return MockResponse()
          ..httpCode = HttpStatus.ok
          ..body = jsonEncode({
            'AED': 'United Arab Emirates Dirham',
            'AFN': 'Afghan Afghani',
            'ALL': 'Albanian Lek'
          });
      }
    };
    setUp(() async {
      server = new MockWebServer();
      server.dispatcher = dispatcher;
      await server.start();
      oxr = Oxr('api_key',
          endpoint: '${server.url.substring(0, server.url.length - 1)}');
    });
    tearDown(() async {
      server.shutdown();
    });
    test('Get latest rates', () async {
      var latest = await oxr.getLatest();
      expect(latest.disclaimer, 'https://openexchangerates.org/terms/');
      expect(latest.license, 'https://openexchangerates.org/license/');
      expect(latest.timestamp, 1449877801);
      expect(latest.base, 'USD');
      expect(latest.rates['AED'], 3.672538);
      expect(latest.rates['AFN'], 66.809999);
      expect(latest.rates['ALL'], 125.716501);
    });
    test('Get historical rates', () async {
      var historical = await oxr.getHistorical(DateTime(2012, 7, 10));
      expect(historical.disclaimer, 'https://openexchangerates.org/terms/');
      expect(historical.license, 'https://openexchangerates.org/license/');
      expect(historical.timestamp, 1449877801);
      expect(historical.base, 'USD');
      expect(historical.rates['AED'], 3.672914);
      expect(historical.rates['AFN'], 48.337601);
      expect(historical.rates['ALL'], 111.863334);
    });
    test('Get currencies', () async {
      var currencies = await oxr.getCurrencies();
      expect(currencies['AED'], 'United Arab Emirates Dirham');
      expect(currencies['AFN'], 'Afghan Afghani');
      expect(currencies['ALL'], 'Albanian Lek');
    });
  });
}
