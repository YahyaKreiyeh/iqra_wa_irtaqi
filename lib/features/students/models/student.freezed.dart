// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Student {

 String get id; String get firstName; String get lastName; String get motherName; String get fatherName; DateTime get birthDate; bool get nominatedGhaibi; bool get nominatedNazari; bool get nominatedHadith; bool? get examPassedGhaibi; bool? get examPassedNazari; bool? get examPassedHadith;
/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentCopyWith<Student> get copyWith => _$StudentCopyWithImpl<Student>(this as Student, _$identity);

  /// Serializes this Student to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Student&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.nominatedGhaibi, nominatedGhaibi) || other.nominatedGhaibi == nominatedGhaibi)&&(identical(other.nominatedNazari, nominatedNazari) || other.nominatedNazari == nominatedNazari)&&(identical(other.nominatedHadith, nominatedHadith) || other.nominatedHadith == nominatedHadith)&&(identical(other.examPassedGhaibi, examPassedGhaibi) || other.examPassedGhaibi == examPassedGhaibi)&&(identical(other.examPassedNazari, examPassedNazari) || other.examPassedNazari == examPassedNazari)&&(identical(other.examPassedHadith, examPassedHadith) || other.examPassedHadith == examPassedHadith));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,motherName,fatherName,birthDate,nominatedGhaibi,nominatedNazari,nominatedHadith,examPassedGhaibi,examPassedNazari,examPassedHadith);

@override
String toString() {
  return 'Student(id: $id, firstName: $firstName, lastName: $lastName, motherName: $motherName, fatherName: $fatherName, birthDate: $birthDate, nominatedGhaibi: $nominatedGhaibi, nominatedNazari: $nominatedNazari, nominatedHadith: $nominatedHadith, examPassedGhaibi: $examPassedGhaibi, examPassedNazari: $examPassedNazari, examPassedHadith: $examPassedHadith)';
}


}

/// @nodoc
abstract mixin class $StudentCopyWith<$Res>  {
  factory $StudentCopyWith(Student value, $Res Function(Student) _then) = _$StudentCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String motherName, String fatherName, DateTime birthDate, bool nominatedGhaibi, bool nominatedNazari, bool nominatedHadith, bool? examPassedGhaibi, bool? examPassedNazari, bool? examPassedHadith
});




}
/// @nodoc
class _$StudentCopyWithImpl<$Res>
    implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._self, this._then);

  final Student _self;
  final $Res Function(Student) _then;

/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? motherName = null,Object? fatherName = null,Object? birthDate = null,Object? nominatedGhaibi = null,Object? nominatedNazari = null,Object? nominatedHadith = null,Object? examPassedGhaibi = freezed,Object? examPassedNazari = freezed,Object? examPassedHadith = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,motherName: null == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,nominatedGhaibi: null == nominatedGhaibi ? _self.nominatedGhaibi : nominatedGhaibi // ignore: cast_nullable_to_non_nullable
as bool,nominatedNazari: null == nominatedNazari ? _self.nominatedNazari : nominatedNazari // ignore: cast_nullable_to_non_nullable
as bool,nominatedHadith: null == nominatedHadith ? _self.nominatedHadith : nominatedHadith // ignore: cast_nullable_to_non_nullable
as bool,examPassedGhaibi: freezed == examPassedGhaibi ? _self.examPassedGhaibi : examPassedGhaibi // ignore: cast_nullable_to_non_nullable
as bool?,examPassedNazari: freezed == examPassedNazari ? _self.examPassedNazari : examPassedNazari // ignore: cast_nullable_to_non_nullable
as bool?,examPassedHadith: freezed == examPassedHadith ? _self.examPassedHadith : examPassedHadith // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Student].
extension StudentPatterns on Student {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Student value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Student() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Student value)  $default,){
final _that = this;
switch (_that) {
case _Student():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Student value)?  $default,){
final _that = this;
switch (_that) {
case _Student() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String motherName,  String fatherName,  DateTime birthDate,  bool nominatedGhaibi,  bool nominatedNazari,  bool nominatedHadith,  bool? examPassedGhaibi,  bool? examPassedNazari,  bool? examPassedHadith)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Student() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.motherName,_that.fatherName,_that.birthDate,_that.nominatedGhaibi,_that.nominatedNazari,_that.nominatedHadith,_that.examPassedGhaibi,_that.examPassedNazari,_that.examPassedHadith);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String motherName,  String fatherName,  DateTime birthDate,  bool nominatedGhaibi,  bool nominatedNazari,  bool nominatedHadith,  bool? examPassedGhaibi,  bool? examPassedNazari,  bool? examPassedHadith)  $default,) {final _that = this;
switch (_that) {
case _Student():
return $default(_that.id,_that.firstName,_that.lastName,_that.motherName,_that.fatherName,_that.birthDate,_that.nominatedGhaibi,_that.nominatedNazari,_that.nominatedHadith,_that.examPassedGhaibi,_that.examPassedNazari,_that.examPassedHadith);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String lastName,  String motherName,  String fatherName,  DateTime birthDate,  bool nominatedGhaibi,  bool nominatedNazari,  bool nominatedHadith,  bool? examPassedGhaibi,  bool? examPassedNazari,  bool? examPassedHadith)?  $default,) {final _that = this;
switch (_that) {
case _Student() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.motherName,_that.fatherName,_that.birthDate,_that.nominatedGhaibi,_that.nominatedNazari,_that.nominatedHadith,_that.examPassedGhaibi,_that.examPassedNazari,_that.examPassedHadith);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Student implements Student {
  const _Student({this.id = '', required this.firstName, required this.lastName, required this.motherName, required this.fatherName, required this.birthDate, this.nominatedGhaibi = false, this.nominatedNazari = false, this.nominatedHadith = false, this.examPassedGhaibi, this.examPassedNazari, this.examPassedHadith});
  factory _Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

@override@JsonKey() final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String motherName;
@override final  String fatherName;
@override final  DateTime birthDate;
@override@JsonKey() final  bool nominatedGhaibi;
@override@JsonKey() final  bool nominatedNazari;
@override@JsonKey() final  bool nominatedHadith;
@override final  bool? examPassedGhaibi;
@override final  bool? examPassedNazari;
@override final  bool? examPassedHadith;

/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentCopyWith<_Student> get copyWith => __$StudentCopyWithImpl<_Student>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Student&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.nominatedGhaibi, nominatedGhaibi) || other.nominatedGhaibi == nominatedGhaibi)&&(identical(other.nominatedNazari, nominatedNazari) || other.nominatedNazari == nominatedNazari)&&(identical(other.nominatedHadith, nominatedHadith) || other.nominatedHadith == nominatedHadith)&&(identical(other.examPassedGhaibi, examPassedGhaibi) || other.examPassedGhaibi == examPassedGhaibi)&&(identical(other.examPassedNazari, examPassedNazari) || other.examPassedNazari == examPassedNazari)&&(identical(other.examPassedHadith, examPassedHadith) || other.examPassedHadith == examPassedHadith));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,motherName,fatherName,birthDate,nominatedGhaibi,nominatedNazari,nominatedHadith,examPassedGhaibi,examPassedNazari,examPassedHadith);

@override
String toString() {
  return 'Student(id: $id, firstName: $firstName, lastName: $lastName, motherName: $motherName, fatherName: $fatherName, birthDate: $birthDate, nominatedGhaibi: $nominatedGhaibi, nominatedNazari: $nominatedNazari, nominatedHadith: $nominatedHadith, examPassedGhaibi: $examPassedGhaibi, examPassedNazari: $examPassedNazari, examPassedHadith: $examPassedHadith)';
}


}

/// @nodoc
abstract mixin class _$StudentCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$StudentCopyWith(_Student value, $Res Function(_Student) _then) = __$StudentCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String motherName, String fatherName, DateTime birthDate, bool nominatedGhaibi, bool nominatedNazari, bool nominatedHadith, bool? examPassedGhaibi, bool? examPassedNazari, bool? examPassedHadith
});




}
/// @nodoc
class __$StudentCopyWithImpl<$Res>
    implements _$StudentCopyWith<$Res> {
  __$StudentCopyWithImpl(this._self, this._then);

  final _Student _self;
  final $Res Function(_Student) _then;

/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? motherName = null,Object? fatherName = null,Object? birthDate = null,Object? nominatedGhaibi = null,Object? nominatedNazari = null,Object? nominatedHadith = null,Object? examPassedGhaibi = freezed,Object? examPassedNazari = freezed,Object? examPassedHadith = freezed,}) {
  return _then(_Student(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,motherName: null == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,nominatedGhaibi: null == nominatedGhaibi ? _self.nominatedGhaibi : nominatedGhaibi // ignore: cast_nullable_to_non_nullable
as bool,nominatedNazari: null == nominatedNazari ? _self.nominatedNazari : nominatedNazari // ignore: cast_nullable_to_non_nullable
as bool,nominatedHadith: null == nominatedHadith ? _self.nominatedHadith : nominatedHadith // ignore: cast_nullable_to_non_nullable
as bool,examPassedGhaibi: freezed == examPassedGhaibi ? _self.examPassedGhaibi : examPassedGhaibi // ignore: cast_nullable_to_non_nullable
as bool?,examPassedNazari: freezed == examPassedNazari ? _self.examPassedNazari : examPassedNazari // ignore: cast_nullable_to_non_nullable
as bool?,examPassedHadith: freezed == examPassedHadith ? _self.examPassedHadith : examPassedHadith // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
