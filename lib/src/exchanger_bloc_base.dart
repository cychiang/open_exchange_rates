import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'params.dart';

// TODO: Ready to be deprecated

class ExchangerBlocBase {
  // log stream
  Stream<String> logStream = Stream.empty();

  Stream<String> get log => logStream;

  // query stream
  ReplaySubject<Params> queryStream = ReplaySubject<Params>();

  Sink<Params> get query => queryStream;

  // dispose stream
  void dispose() {
    queryStream.close();
  }
}
