import 'package:open_exchange_rates/open_exchange_rates.dart';

// example code
main() async {
  ExchangerBloc bloc = ExchangerBloc(Latest());
  bloc.query.add(Params(api_key: 'api_key'));
  bloc.results.forEach((item) => item.forEach((val) =>
      print('${val.currency}: ${val.ratio}')
  ));
  bloc.dispose();
}
