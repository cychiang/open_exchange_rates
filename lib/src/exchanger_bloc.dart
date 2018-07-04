import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'api.dart';
import 'datatype.dart';
import 'exchanger_bloc_base.dart';

class QueryLatest extends ExchangerBlocBase {
  // Declare API
  Latest latest = Latest();

  // Result stream
  Stream<List<Rate>> _results = Stream.empty();

  // Expose result stream
  Stream<List<Rate>> get results => _results;

  QueryLatest.get() {
    _results = queryStream.distinct().asyncMap(latest.get).asBroadcastStream();
    logStream = Observable(results)
        .withLatestFrom(queryStream.stream, (_, query) => 'Latest')
        .asBroadcastStream();
  }
}

class QueryHistorical extends ExchangerBlocBase {
  // Declare API
  Historical historical = Historical();

  // Result stream
  Stream<List<Rate>> _results = Stream.empty();

  // Expose result stream
  Stream<List<Rate>> get results => _results;

  QueryHistorical.get() {
    _results =
        queryStream.distinct().asyncMap(historical.get).asBroadcastStream();
    logStream = Observable(results)
        .withLatestFrom(queryStream.stream, (_, query) => 'Historical')
        .asBroadcastStream();
  }
}

class QueryCurrencies extends ExchangerBlocBase {
  // Declare API
  Currencies currencies = Currencies();

  // Result stream
  Stream<List<Currency>> _results = Stream.empty();

  // Expose result stream
  Stream<List<Currency>> get results => _results;

  QueryCurrencies.get() {
    _results =
        queryStream.distinct().asyncMap(currencies.get).asBroadcastStream();
    logStream = Observable(results)
        .withLatestFrom(queryStream.stream, (_, query) => 'Currencies')
        .asBroadcastStream();
  }
}
