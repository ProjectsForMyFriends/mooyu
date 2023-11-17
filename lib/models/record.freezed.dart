// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordItem _$RecordItemFromJson(Map<String, dynamic> json) {
  return _RecordItem.fromJson(json);
}

/// @nodoc
mixin _$RecordItem {
  String get department => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get serialNumber => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String? get remark => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordItemCopyWith<RecordItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordItemCopyWith<$Res> {
  factory $RecordItemCopyWith(
          RecordItem value, $Res Function(RecordItem) then) =
      _$RecordItemCopyWithImpl<$Res, RecordItem>;
  @useResult
  $Res call(
      {String department,
      String brand,
      String type,
      String serialNumber,
      String date,
      String? remark,
      bool selected});
}

/// @nodoc
class _$RecordItemCopyWithImpl<$Res, $Val extends RecordItem>
    implements $RecordItemCopyWith<$Res> {
  _$RecordItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = null,
    Object? brand = null,
    Object? type = null,
    Object? serialNumber = null,
    Object? date = null,
    Object? remark = freezed,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      serialNumber: null == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordItemImplCopyWith<$Res>
    implements $RecordItemCopyWith<$Res> {
  factory _$$RecordItemImplCopyWith(
          _$RecordItemImpl value, $Res Function(_$RecordItemImpl) then) =
      __$$RecordItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String department,
      String brand,
      String type,
      String serialNumber,
      String date,
      String? remark,
      bool selected});
}

/// @nodoc
class __$$RecordItemImplCopyWithImpl<$Res>
    extends _$RecordItemCopyWithImpl<$Res, _$RecordItemImpl>
    implements _$$RecordItemImplCopyWith<$Res> {
  __$$RecordItemImplCopyWithImpl(
      _$RecordItemImpl _value, $Res Function(_$RecordItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = null,
    Object? brand = null,
    Object? type = null,
    Object? serialNumber = null,
    Object? date = null,
    Object? remark = freezed,
    Object? selected = null,
  }) {
    return _then(_$RecordItemImpl(
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      serialNumber: null == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordItemImpl implements _RecordItem {
  _$RecordItemImpl(
      {required this.department,
      required this.brand,
      required this.type,
      required this.serialNumber,
      required this.date,
      this.remark,
      required this.selected});

  factory _$RecordItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordItemImplFromJson(json);

  @override
  final String department;
  @override
  final String brand;
  @override
  final String type;
  @override
  final String serialNumber;
  @override
  final String date;
  @override
  final String? remark;
  @override
  final bool selected;

  @override
  String toString() {
    return 'RecordItem(department: $department, brand: $brand, type: $type, serialNumber: $serialNumber, date: $date, remark: $remark, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordItemImpl &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, department, brand, type,
      serialNumber, date, remark, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordItemImplCopyWith<_$RecordItemImpl> get copyWith =>
      __$$RecordItemImplCopyWithImpl<_$RecordItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordItemImplToJson(
      this,
    );
  }
}

abstract class _RecordItem implements RecordItem {
  factory _RecordItem(
      {required final String department,
      required final String brand,
      required final String type,
      required final String serialNumber,
      required final String date,
      final String? remark,
      required final bool selected}) = _$RecordItemImpl;

  factory _RecordItem.fromJson(Map<String, dynamic> json) =
      _$RecordItemImpl.fromJson;

  @override
  String get department;
  @override
  String get brand;
  @override
  String get type;
  @override
  String get serialNumber;
  @override
  String get date;
  @override
  String? get remark;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$RecordItemImplCopyWith<_$RecordItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
