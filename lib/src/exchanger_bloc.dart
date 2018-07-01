import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'api.dart';
import 'rate.dart';
import 'params.dart';

class ExchangerBloc {
  // supported API: latest, currencies
  Latest latest;
  Currencies currencies;
  Stream<List<Rate>> _results = Stream.empty();
  Stream<List<Currency>> _currencies = Stream.empty();
  Stream<String> _log = Stream.empty();

  ReplaySubject<Params> _query = ReplaySubject<Params>();

  Stream<List<Rate>> get results => _results;
  Stream<List<Currency>> get currency => _currencies;
  Stream<String> get log => _log;
  Sink<Params> get query => _query;
  // constructor
  ExchangerBloc(){}

  ExchangerBloc.fromLatest(this.latest) {
    _results = _query.distinct().asyncMap(latest.get).asBroadcastStream();
    _log = Observable(results)
        .withLatestFrom(_query.stream, (_, query) => 'Latest $query')
        .asBroadcastStream();
  }

  ExchangerBloc.fromCurrencies(this.currencies) {
    _currencies = _query.distinct().asyncMap(currencies.get).asBroadcastStream();
    _log = Observable(currency)
        .withLatestFrom(_query.stream, (_, query) => 'Currencies $query')
        .asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }
}