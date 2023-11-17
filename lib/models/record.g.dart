// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordItemImpl _$$RecordItemImplFromJson(Map<String, dynamic> json) =>
    _$RecordItemImpl(
      department: json['department'] as String,
      brand: json['brand'] as String,
      type: json['type'] as String,
      serialNumber: json['serialNumber'] as String,
      date: json['date'] as String,
      remark: json['remark'] as String?,
      selected: json['selected'] as bool,
    );

Map<String, dynamic> _$$RecordItemImplToJson(_$RecordItemImpl instance) =>
    <String, dynamic>{
      'department': instance.department,
      'brand': instance.brand,
      'type': instance.type,
      'serialNumber': instance.serialNumber,
      'date': instance.date,
      'remark': instance.remark,
      'selected': instance.selected,
    };
