import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'api.dart';
import 'rate.dart';
import 'params.dart';

class ExchangerBloc {
//  Perform latest request
  final API api;
  Stream<List<Rate>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();

  ReplaySubject<Params> _query = ReplaySubject<Params>();

  Stream<List<Rate>> get results => _results;
  Stream<String> get log => _log;
  Sink<Params> get query => _query;

  ExchangerBloc(this.api) {
    _results = _query.distinct().asyncMap(api.get).asBroadcastStream();
    _log = Observable(results)
        .withLatestFrom(_query.stream, (_, query) => 'Hi $query')
        .asBroadcastStream();
  }
  void dispose() {
    _query.close();
  }
}