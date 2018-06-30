import 'dart:async';
import '../lib/src/rate.dart';
import '../lib/src/api.dart';
import '../lib/src/exchanger_bloc.dart';
import '../lib/src/params.dart';

// example code
main() async {
  ExchangerBloc bloc = ExchangerBloc(API());
  Stream<List<Rate>> result = bloc.results;

  bloc.query.add(Params(api_key: 'api_key'));
  result.forEach((item) => item.forEach((val) =>
      print('${val.currency}: ${val.ratio}')
  ));
}
