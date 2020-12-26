part of '../oxr_models.dart';

@JsonSerializable()
class Latest {
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


  Latest({this.disclaimer, this.license, this.timestamp, this.base, this.rates});

  factory Latest.fromJson(Map<String, dynamic> json) => _$LatestFromJson(json);

  Map<String, dynamic> toJson() => _$LatestToJson(this);
}
