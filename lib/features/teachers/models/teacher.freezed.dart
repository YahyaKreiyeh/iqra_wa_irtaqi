// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Teacher {

 String get id; String get firstName; String get lastName; String get motherName; String get fatherName; DateTime get birthDate;
/// Create a copy of Teacher
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherCopyWith<Teacher> get copyWith => _$TeacherCopyWithImpl<Teacher>(this as Teacher, _$identity);

  /// Serializes this Teacher to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Teacher&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,motherName,fatherName,birthDate);

@override
String toString() {
  return 'Teacher(id: $id, firstName: $firstName, lastName: $lastName, motherName: $motherName, fatherName: $fatherName, birthDate: $birthDate)';
}


}

/// @nodoc
abstract mixin class $TeacherCopyWith<$Res>  {
  factory $TeacherCopyWith(Teacher value, $Res Function(Teacher) _then) = _$TeacherCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String motherName, String fatherName, DateTime birthDate
});




}
/// @nodoc
class _$TeacherCopyWithImpl<$Res>
    implements $TeacherCopyWith<$Res> {
  _$TeacherCopyWithImpl(this._self, this._then);

  final Teacher _self;
  final $Res Function(Teacher) _then;

/// Create a copy of Teacher
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? motherName = null,Object? fatherName = null,Object? birthDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,motherName: null == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Teacher].
extension TeacherPatterns on Teacher {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Teacher value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Teacher() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Teacher value)  $default,){
final _that = this;
switch (_that) {
case _Teacher():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Teacher value)?  $default,){
final _that = this;
switch (_that) {
case _Teacher() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String motherName,  String fatherName,  DateTime birthDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Teacher() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.motherName,_that.fatherName,_that.birthDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String motherName,  String fatherName,  DateTime birthDate)  $default,) {final _that = this;
switch (_that) {
case _Teacher():
return $default(_that.id,_that.firstName,_that.lastName,_that.motherName,_that.fatherName,_that.birthDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String lastName,  String motherName,  String fatherName,  DateTime birthDate)?  $default,) {final _that = this;
switch (_that) {
case _Teacher() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.motherName,_that.fatherName,_that.birthDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Teacher implements Teacher {
  const _Teacher({required this.id, required this.firstName, required this.lastName, required this.motherName, required this.fatherName, required this.birthDate});
  factory _Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

@override final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String motherName;
@override final  String fatherName;
@override final  DateTime birthDate;

/// Create a copy of Teacher
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherCopyWith<_Teacher> get copyWith => __$TeacherCopyWithImpl<_Teacher>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Teacher&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,motherName,fatherName,birthDate);

@override
String toString() {
  return 'Teacher(id: $id, firstName: $firstName, lastName: $lastName, motherName: $motherName, fatherName: $fatherName, birthDate: $birthDate)';
}


}

/// @nodoc
abstract mixin class _$TeacherCopyWith<$Res> implements $TeacherCopyWith<$Res> {
  factory _$TeacherCopyWith(_Teacher value, $Res Function(_Teacher) _then) = __$TeacherCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String motherName, String fatherName, DateTime birthDate
});




}
/// @nodoc
class __$TeacherCopyWithImpl<$Res>
    implements _$TeacherCopyWith<$Res> {
  __$TeacherCopyWithImpl(this._self, this._then);

  final _Teacher _self;
  final $Res Function(_Teacher) _then;

/// Create a copy of Teacher
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? motherName = null,Object? fatherName = null,Object? birthDate = null,}) {
  return _then(_Teacher(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,motherName: null == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
