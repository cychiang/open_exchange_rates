// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oxr_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rates _$RatesFromJson(Map<String, dynamic> json) {
  return Rates(
    disclaimer: json['disclaimer'] as String,
    license: json['license'] as String,
    timestamp: json['timestamp'] as int,
    base: json['base'] as String,
    rates: (json['rates'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, (e as num).toDouble()),
    ),
  );
}

Map<String, dynamic> _$RatesToJson(Rates instance) => <String, dynamic>{
      'disclaimer': instance.disclaimer,
      'license': instance.license,
      'timestamp': instance.timestamp,
      'base': instance.base,
      'rates': instance.rates,
    };

QueryParams _$QueryParamsFromJson(Map<String, dynamic> json) {
  return QueryParams(
    base: json['base'] as String,
    symbols: json['symbols'] as String,
    prettyPrint: json['prettyprint'] as bool,
    showAlternative: json['show_alternative'] as bool,
  );
}

Map<String, dynamic> _$QueryParamsToJson(QueryParams instance) => <String, dynamic>{
      'base': instance.base,
      'symbols': instance.symbols,
      'prettyprint': instance.prettyPrint,
      'show_alternative': instance.showAlternative,
    };
