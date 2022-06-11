part of '../oxr_models.dart';

@JsonSerializable()
class Rates {
  @JsonKey(name: 'disclaimer')
  String? disclaimer;
  @JsonKey(name: 'license')
  String? license;
  @JsonKey(name: 'timestamp')
  int timestamp = 0;
  @JsonKey(name: 'base')
  String? base;
  @JsonKey(name: 'rates')
  Map<String, double> rates;

  Rates({this.disclaimer, this.license, this.timestamp = 0, this.base, this.rates = const {}});

  factory Rates.fromJson(Map<String, dynamic> json) => _$RatesFromJson(json);

  Map<String, dynamic> toJson() => _$RatesToJson(this);
}
