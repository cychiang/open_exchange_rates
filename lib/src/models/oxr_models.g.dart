// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oxr_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryParams _$QueryParamsFromJson(Map<String, dynamic> json) => QueryParams(
      base: json['base'] as String?,
      symbols: json['symbols'] as String?,
      prettyPrint: json['prettyprint'] as bool? ?? true,
      showAlternative: json['show_alternative'] as bool? ?? false,
    );

Map<String, dynamic> _$QueryParamsToJson(QueryParams instance) =>
    <String, dynamic>{
      'base': instance.base,
      'symbols': instance.symbols,
      'prettyprint': instance.prettyPrint,
      'show_alternative': instance.showAlternative,
    };

Rates _$RatesFromJson(Map<String, dynamic> json) => Rates(
      disclaimer: json['disclaimer'] as String?,
      license: json['license'] as String?,
      timestamp: json['timestamp'] as int? ?? 0,
      base: json['base'] as String?,
      rates: (json['rates'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
    );

Map<String, dynamic> _$RatesToJson(Rates instance) => <String, dynamic>{
      'disclaimer': instance.disclaimer,
      'license': instance.license,
      'timestamp': instance.timestamp,
      'base': instance.base,
      'rates': instance.rates,
    };
