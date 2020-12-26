part of '../oxr_models.dart';

@JsonSerializable()
class QueryParams {
  @JsonKey(name: 'base')
  String base;
  @JsonKey(name: 'symbols')
  String symbols;
  @JsonKey(name: 'prettyprint')
  bool prettyPrint;
  @JsonKey(name: 'show_alternative')
  bool showAlternative;
  @JsonKey(name: 'show_inactive')
  bool showInactive;

  QueryParams(
      {this.base,
      this.symbols,
      this.prettyPrint,
      this.showAlternative,
      this.showInactive});

  factory QueryParams.fromJson(Map<String, dynamic> json) =>
      _$QueryParamsFromJson(json);

  Map<String, dynamic> toJson() => _$QueryParamsToJson(this);
}
