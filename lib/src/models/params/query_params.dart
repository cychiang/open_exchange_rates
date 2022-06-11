part of '../oxr_models.dart';

@JsonSerializable()
class QueryParams {
  @JsonKey(name: 'base')
  String? base;
  @JsonKey(name: 'symbols')
  String? symbols;
  @JsonKey(name: 'prettyprint')
  bool prettyPrint = false;
  @JsonKey(name: 'show_alternative')
  bool showAlternative = false;

  QueryParams({this.base, this.symbols, this.prettyPrint = false, this.showAlternative = false});

  factory QueryParams.fromJson(Map<String, dynamic> json) => _$QueryParamsFromJson(json);

  Map<String, dynamic> toJson() => _$QueryParamsToJson(this);
}
