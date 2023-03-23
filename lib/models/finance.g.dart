// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Finance _$$_FinanceFromJson(Map<String, dynamic> json) => _$_Finance(
      id: json['id'] as int,
      operationNumber: json['operationNumber'] as int,
      operationName: json['operationName'] as String,
      description: json['description'] as String,
      operationDate: DateTime.parse(json['operationDate'] as String),
      transactionAmount: (json['transactionAmount'] as num).toDouble(),
      logicalDel: json['logicalDel'] as int,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_FinanceToJson(_$_Finance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operationNumber': instance.operationNumber,
      'operationName': instance.operationName,
      'description': instance.description,
      'operationDate': instance.operationDate.toIso8601String(),
      'transactionAmount': instance.transactionAmount,
      'logicalDel': instance.logicalDel,
      'category': instance.category,
    };
