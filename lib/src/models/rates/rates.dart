part of '../oxr_models.dart';

@JsonSerializable()
class Rates {
  @JsonKey(name: 'disclaimer')
  String disclaimer;
  @JsonKey(name: 'license')
  String license;
  @JsonKey(name: 'timestamp')
  int timestamp;
  @JsonKey(name: 'base')
  String base;
  @JsonKey(name: 'rates')
  Map<String, double> rates;

  Rates({this.disclaimer, this.license, this.timestamp, this.base, this.rates});

  factory Rates.fromJson(Map<String, dynamic> json) => _$RatesFromJson(json);

  Map<String, dynamic> toJson() => _$RatesToJson(this);
}
