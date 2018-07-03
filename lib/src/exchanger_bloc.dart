import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'api.dart';
import 'rate.dart';
import 'params.dart';

class ExchangerBloc {
  // supported API: latest, currencies
  Latest latest;
  Currencies currencies;
  Historical historical;
  Stream<List<Rate>> _results = Stream.empty();
  Stream<List<Currency>> _currencies = Stream.empty();
  Stream<List<Rate>> _historical = Stream.empty();
  Stream<String> _log = Stream.empty();

  ReplaySubject<Params> _query = ReplaySubject<Params>();

  Stream<List<Rate>> get results => _results;
  Stream<List<Currency>> get currency => _currencies;
  Stream<List<Rate>> get history => _historical;
  Stream<String> get log => _log;
  Sink<Params> get query => _query;
  // constructor
  ExchangerBloc(){}

  ExchangerBloc.fromLatest(this.latest) {
    _results = _query.distinct().asyncMap(latest.get).asBroadcastStream();
    _log = Observable(results)
        .withLatestFrom(_query.stream, (_, query) => 'Latest')
        .asBroadcastStream();
  }

  ExchangerBloc.fromCurrencies(this.currencies) {
    _currencies = _query.distinct().asyncMap(currencies.get).asBroadcastStream();
    _log = Observable(currency)
        .withLatestFrom(_query.stream, (_, query) => 'Currencies')
        .asBroadcastStream();
  }

  ExchangerBloc.fromHistorical(this.historical) {
    _historical = _query.distinct().asyncMap(historical.get).asBroadcastStream();
    _log = Observable(history)
        .withLatestFrom(_query.stream, (_, query) => 'Historical')
        .asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }
}