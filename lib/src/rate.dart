class Rate {
  final String currency;
  final num ratio;
  Rate(this.currency, this.ratio);
  Rate.fromMap(key, value):
        currency = key,
        ratio = value;
}