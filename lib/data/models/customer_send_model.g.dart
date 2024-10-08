// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_send_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerSendModelImpl _$$CustomerSendModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerSendModelImpl(
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      id: (json['id'] as num?)?.toInt(),
      deleteFlag: json['delete_flag'] as bool?,
    );

Map<String, dynamic> _$$CustomerSendModelImplToJson(
        _$CustomerSendModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'birth_date': instance.birthDate?.toIso8601String(),
      'id': instance.id,
      'delete_flag': instance.deleteFlag,
    };
