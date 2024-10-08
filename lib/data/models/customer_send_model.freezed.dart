// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_send_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerSendModel _$CustomerSendModelFromJson(Map<String, dynamic> json) {
  return _CustomerSendModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerSendModel {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "birth_date")
  DateTime? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "delete_flag")
  bool? get deleteFlag => throw _privateConstructorUsedError;

  /// Serializes this CustomerSendModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerSendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerSendModelCopyWith<CustomerSendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSendModelCopyWith<$Res> {
  factory $CustomerSendModelCopyWith(
          CustomerSendModel value, $Res Function(CustomerSendModel) then) =
      _$CustomerSendModelCopyWithImpl<$Res, CustomerSendModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "birth_date") DateTime? birthDate,
      @JsonKey(name: "id") int? id,
      @JsonKey(name: "delete_flag") bool? deleteFlag});
}

/// @nodoc
class _$CustomerSendModelCopyWithImpl<$Res, $Val extends CustomerSendModel>
    implements $CustomerSendModelCopyWith<$Res> {
  _$CustomerSendModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerSendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? birthDate = freezed,
    Object? id = freezed,
    Object? deleteFlag = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      deleteFlag: freezed == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerSendModelImplCopyWith<$Res>
    implements $CustomerSendModelCopyWith<$Res> {
  factory _$$CustomerSendModelImplCopyWith(_$CustomerSendModelImpl value,
          $Res Function(_$CustomerSendModelImpl) then) =
      __$$CustomerSendModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "birth_date") DateTime? birthDate,
      @JsonKey(name: "id") int? id,
      @JsonKey(name: "delete_flag") bool? deleteFlag});
}

/// @nodoc
class __$$CustomerSendModelImplCopyWithImpl<$Res>
    extends _$CustomerSendModelCopyWithImpl<$Res, _$CustomerSendModelImpl>
    implements _$$CustomerSendModelImplCopyWith<$Res> {
  __$$CustomerSendModelImplCopyWithImpl(_$CustomerSendModelImpl _value,
      $Res Function(_$CustomerSendModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerSendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? birthDate = freezed,
    Object? id = freezed,
    Object? deleteFlag = freezed,
  }) {
    return _then(_$CustomerSendModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      deleteFlag: freezed == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerSendModelImpl implements _CustomerSendModel {
  _$CustomerSendModelImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey(name: "birth_date") this.birthDate,
      @JsonKey(name: "id") this.id,
      @JsonKey(name: "delete_flag") this.deleteFlag});

  factory _$CustomerSendModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerSendModelImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  @JsonKey(name: "birth_date")
  final DateTime? birthDate;
  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "delete_flag")
  final bool? deleteFlag;

  @override
  String toString() {
    return 'CustomerSendModel(name: $name, phoneNumber: $phoneNumber, birthDate: $birthDate, id: $id, deleteFlag: $deleteFlag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSendModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deleteFlag, deleteFlag) ||
                other.deleteFlag == deleteFlag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, phoneNumber, birthDate, id, deleteFlag);

  /// Create a copy of CustomerSendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSendModelImplCopyWith<_$CustomerSendModelImpl> get copyWith =>
      __$$CustomerSendModelImplCopyWithImpl<_$CustomerSendModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerSendModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerSendModel implements CustomerSendModel {
  factory _CustomerSendModel(
          {@JsonKey(name: "name") final String? name,
          @JsonKey(name: "phone_number") final String? phoneNumber,
          @JsonKey(name: "birth_date") final DateTime? birthDate,
          @JsonKey(name: "id") final int? id,
          @JsonKey(name: "delete_flag") final bool? deleteFlag}) =
      _$CustomerSendModelImpl;

  factory _CustomerSendModel.fromJson(Map<String, dynamic> json) =
      _$CustomerSendModelImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(name: "birth_date")
  DateTime? get birthDate;
  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "delete_flag")
  bool? get deleteFlag;

  /// Create a copy of CustomerSendModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerSendModelImplCopyWith<_$CustomerSendModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
