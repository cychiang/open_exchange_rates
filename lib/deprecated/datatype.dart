
// TODO: Ready to be deprecated

class Rate {
  final String currency;
  final num ratio;

  Rate(this.currency, this.ratio);

  Rate.fromMap(key, value)
      : currency = key,
        ratio = value;
}

class Currency {
  final String currency;
  final String name;

  Currency(this.currency, this.name);

  Currency.fromMap(key, value)
      : currency = key,
        name = value;
}
