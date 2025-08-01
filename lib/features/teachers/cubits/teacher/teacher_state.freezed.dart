// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeacherState {

 String get id; bool get isEditing; String get initialFirstName; String get initialLastName; String get initialMotherName; String get initialFatherName; DateTime? get initialBirthDate; String get firstName; String? get firstNameError; String get lastName; String? get lastNameError; String get motherName; String? get motherNameError; String get fatherName; String? get fatherNameError; DateTime? get birthDate; bool get shouldConfirmDuplicate; Result get status;
/// Create a copy of TeacherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherStateCopyWith<TeacherState> get copyWith => _$TeacherStateCopyWithImpl<TeacherState>(this as TeacherState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherState&&(identical(other.id, id) || other.id == id)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.initialFirstName, initialFirstName) || other.initialFirstName == initialFirstName)&&(identical(other.initialLastName, initialLastName) || other.initialLastName == initialLastName)&&(identical(other.initialMotherName, initialMotherName) || other.initialMotherName == initialMotherName)&&(identical(other.initialFatherName, initialFatherName) || other.initialFatherName == initialFatherName)&&(identical(other.initialBirthDate, initialBirthDate) || other.initialBirthDate == initialBirthDate)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.firstNameError, firstNameError) || other.firstNameError == firstNameError)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.lastNameError, lastNameError) || other.lastNameError == lastNameError)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.motherNameError, motherNameError) || other.motherNameError == motherNameError)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.fatherNameError, fatherNameError) || other.fatherNameError == fatherNameError)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.shouldConfirmDuplicate, shouldConfirmDuplicate) || other.shouldConfirmDuplicate == shouldConfirmDuplicate)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,isEditing,initialFirstName,initialLastName,initialMotherName,initialFatherName,initialBirthDate,firstName,firstNameError,lastName,lastNameError,motherName,motherNameError,fatherName,fatherNameError,birthDate,shouldConfirmDuplicate,status);

@override
String toString() {
  return 'TeacherState(id: $id, isEditing: $isEditing, initialFirstName: $initialFirstName, initialLastName: $initialLastName, initialMotherName: $initialMotherName, initialFatherName: $initialFatherName, initialBirthDate: $initialBirthDate, firstName: $firstName, firstNameError: $firstNameError, lastName: $lastName, lastNameError: $lastNameError, motherName: $motherName, motherNameError: $motherNameError, fatherName: $fatherName, fatherNameError: $fatherNameError, birthDate: $birthDate, shouldConfirmDuplicate: $shouldConfirmDuplicate, status: $status)';
}


}

/// @nodoc
abstract mixin class $TeacherStateCopyWith<$Res>  {
  factory $TeacherStateCopyWith(TeacherState value, $Res Function(TeacherState) _then) = _$TeacherStateCopyWithImpl;
@useResult
$Res call({
 String id, bool isEditing, String initialFirstName, String initialLastName, String initialMotherName, String initialFatherName, DateTime? initialBirthDate, String firstName, String? firstNameError, String lastName, String? lastNameError, String motherName, String? motherNameError, String fatherName, String? fatherNameError, DateTime? birthDate, bool shouldConfirmDuplicate, Result status
});


$ResultCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class _$TeacherStateCopyWithImpl<$Res>
    implements $TeacherStateCopyWith<$Res> {
  _$TeacherStateCopyWithImpl(this._self, this._then);

  final TeacherState _self;
  final $Res Function(TeacherState) _then;

/// Create a copy of TeacherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isEditing = null,Object? initialFirstName = null,Object? initialLastName = null,Object? initialMotherName = null,Object? initialFatherName = null,Object? initialBirthDate = freezed,Object? firstName = null,Object? firstNameError = freezed,Object? lastName = null,Object? lastNameError = freezed,Object? motherName = null,Object? motherNameError = freezed,Object? fatherName = null,Object? fatherNameError = freezed,Object? birthDate = freezed,Object? shouldConfirmDuplicate = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,initialFirstName: null == initialFirstName ? _self.initialFirstName : initialFirstName // ignore: cast_nullable_to_non_nullable
as String,initialLastName: null == initialLastName ? _self.initialLastName : initialLastName // ignore: cast_nullable_to_non_nullable
as String,initialMotherName: null == initialMotherName ? _self.initialMotherName : initialMotherName // ignore: cast_nullable_to_non_nullable
as String,initialFatherName: null == initialFatherName ? _self.initialFatherName : initialFatherName // ignore: cast_nullable_to_non_nullable
as String,initialBirthDate: freezed == initialBirthDate ? _self.initialBirthDate : initialBirthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,firstNameError: freezed == firstNameError ? _self.firstNameError : firstNameError // ignore: cast_nullable_to_non_nullable
as String?,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,lastNameError: freezed == lastNameError ? _self.lastNameError : lastNameError // ignore: cast_nullable_to_non_nullable
as String?,motherName: null == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String,motherNameError: freezed == motherNameError ? _self.motherNameError : motherNameError // ignore: cast_nullable_to_non_nullable
as String?,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,fatherNameError: freezed == fatherNameError ? _self.fatherNameError : fatherNameError // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,shouldConfirmDuplicate: null == shouldConfirmDuplicate ? _self.shouldConfirmDuplicate : shouldConfirmDuplicate // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Result,
  ));
}
/// Create a copy of TeacherState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res> get status {
  
  return $ResultCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeacherState].
extension TeacherStatePatterns on TeacherState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeacherState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeacherState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeacherState value)  $default,){
final _that = this;
switch (_that) {
case _TeacherState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeacherState value)?  $default,){
final _that = this;
switch (_that) {
case _TeacherState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool isEditing,  String initialFirstName,  String initialLastName,  String initialMotherName,  String initialFatherName,  DateTime? initialBirthDate,  String firstName,  String? firstNameError,  String lastName,  String? lastNameError,  String motherName,  String? motherNameError,  String fatherName,  String? fatherNameError,  DateTime? birthDate,  bool shouldConfirmDuplicate,  Result status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeacherState() when $default != null:
return $default(_that.id,_that.isEditing,_that.initialFirstName,_that.initialLastName,_that.initialMotherName,_that.initialFatherName,_that.initialBirthDate,_that.firstName,_that.firstNameError,_that.lastName,_that.lastNameError,_that.motherName,_that.motherNameError,_that.fatherName,_that.fatherNameError,_that.birthDate,_that.shouldConfirmDuplicate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool isEditing,  String initialFirstName,  String initialLastName,  String initialMotherName,  String initialFatherName,  DateTime? initialBirthDate,  String firstName,  String? firstNameError,  String lastName,  String? lastNameError,  String motherName,  String? motherNameError,  String fatherName,  String? fatherNameError,  DateTime? birthDate,  bool shouldConfirmDuplicate,  Result status)  $default,) {final _that = this;
switch (_that) {
case _TeacherState():
return $default(_that.id,_that.isEditing,_that.initialFirstName,_that.initialLastName,_that.initialMotherName,_that.initialFatherName,_that.initialBirthDate,_that.firstName,_that.firstNameError,_that.lastName,_that.lastNameError,_that.motherName,_that.motherNameError,_that.fatherName,_that.fatherNameError,_that.birthDate,_that.shouldConfirmDuplicate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool isEditing,  String initialFirstName,  String initialLastName,  String initialMotherName,  String initialFatherName,  DateTime? initialBirthDate,  String firstName,  String? firstNameError,  String lastName,  String? lastNameError,  String motherName,  String? motherNameError,  String fatherName,  String? fatherNameError,  DateTime? birthDate,  bool shouldConfirmDuplicate,  Result status)?  $default,) {final _that = this;
switch (_that) {
case _TeacherState() when $default != null:
return $default(_that.id,_that.isEditing,_that.initialFirstName,_that.initialLastName,_that.initialMotherName,_that.initialFatherName,_that.initialBirthDate,_that.firstName,_that.firstNameError,_that.lastName,_that.lastNameError,_that.motherName,_that.motherNameError,_that.fatherName,_that.fatherNameError,_that.birthDate,_that.shouldConfirmDuplicate,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _TeacherState implements TeacherState {
   _TeacherState({this.id = '', this.isEditing = false, this.initialFirstName = '', this.initialLastName = '', this.initialMotherName = '', this.initialFatherName = '', this.initialBirthDate, this.firstName = '', this.firstNameError, this.lastName = '', this.lastNameError, this.motherName = '', this.motherNameError, this.fatherName = '', this.fatherNameError, this.birthDate, this.shouldConfirmDuplicate = false, this.status = const Result.empty()});
  

@override@JsonKey() final  String id;
@override@JsonKey() final  bool isEditing;
@override@JsonKey() final  String initialFirstName;
@override@JsonKey() final  String initialLastName;
@override@JsonKey() final  String initialMotherName;
@override@JsonKey() final  String initialFatherName;
@override final  DateTime? initialBirthDate;
@override@JsonKey() final  String firstName;
@override final  String? firstNameError;
@override@JsonKey() final  String lastName;
@override final  String? lastNameError;
@override@JsonKey() final  String motherName;
@override final  String? motherNameError;
@override@JsonKey() final  String fatherName;
@override final  String? fatherNameError;
@override final  DateTime? birthDate;
@override@JsonKey() final  bool shouldConfirmDuplicate;
@override@JsonKey() final  Result status;

/// Create a copy of TeacherState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeacherStateCopyWith<_TeacherState> get copyWith => __$TeacherStateCopyWithImpl<_TeacherState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeacherState&&(identical(other.id, id) || other.id == id)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.initialFirstName, initialFirstName) || other.initialFirstName == initialFirstName)&&(identical(other.initialLastName, initialLastName) || other.initialLastName == initialLastName)&&(identical(other.initialMotherName, initialMotherName) || other.initialMotherName == initialMotherName)&&(identical(other.initialFatherName, initialFatherName) || other.initialFatherName == initialFatherName)&&(identical(other.initialBirthDate, initialBirthDate) || other.initialBirthDate == initialBirthDate)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.firstNameError, firstNameError) || other.firstNameError == firstNameError)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.lastNameError, lastNameError) || other.lastNameError == lastNameError)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.motherNameError, motherNameError) || other.motherNameError == motherNameError)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.fatherNameError, fatherNameError) || other.fatherNameError == fatherNameError)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.shouldConfirmDuplicate, shouldConfirmDuplicate) || other.shouldConfirmDuplicate == shouldConfirmDuplicate)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,isEditing,initialFirstName,initialLastName,initialMotherName,initialFatherName,initialBirthDate,firstName,firstNameError,lastName,lastNameError,motherName,motherNameError,fatherName,fatherNameError,birthDate,shouldConfirmDuplicate,status);

@override
String toString() {
  return 'TeacherState(id: $id, isEditing: $isEditing, initialFirstName: $initialFirstName, initialLastName: $initialLastName, initialMotherName: $initialMotherName, initialFatherName: $initialFatherName, initialBirthDate: $initialBirthDate, firstName: $firstName, firstNameError: $firstNameError, lastName: $lastName, lastNameError: $lastNameError, motherName: $motherName, motherNameError: $motherNameError, fatherName: $fatherName, fatherNameError: $fatherNameError, birthDate: $birthDate, shouldConfirmDuplicate: $shouldConfirmDuplicate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TeacherStateCopyWith<$Res> implements $TeacherStateCopyWith<$Res> {
  factory _$TeacherStateCopyWith(_TeacherState value, $Res Function(_TeacherState) _then) = __$TeacherStateCopyWithImpl;
@override @useResult
$Res call({
 String id, bool isEditing, String initialFirstName, String initialLastName, String initialMotherName, String initialFatherName, DateTime? initialBirthDate, String firstName, String? firstNameError, String lastName, String? lastNameError, String motherName, String? motherNameError, String fatherName, String? fatherNameError, DateTime? birthDate, bool shouldConfirmDuplicate, Result status
});


@override $ResultCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class __$TeacherStateCopyWithImpl<$Res>
    implements _$TeacherStateCopyWith<$Res> {
  __$TeacherStateCopyWithImpl(this._self, this._then);

  final _TeacherState _self;
  final $Res Function(_TeacherState) _then;

/// Create a copy of TeacherState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isEditing = null,Object? initialFirstName = null,Object? initialLastName = null,Object? initialMotherName = null,Object? initialFatherName = null,Object? initialBirthDate = freezed,Object? firstName = null,Object? firstNameError = freezed,Object? lastName = null,Object? lastNameError = freezed,Object? motherName = null,Object? motherNameError = freezed,Object? fatherName = null,Object? fatherNameError = freezed,Object? birthDate = freezed,Object? shouldConfirmDuplicate = null,Object? status = null,}) {
  return _then(_TeacherState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,initialFirstName: null == initialFirstName ? _self.initialFirstName : initialFirstName // ignore: cast_nullable_to_non_nullable
as String,initialLastName: null == initialLastName ? _self.initialLastName : initialLastName // ignore: cast_nullable_to_non_nullable
as String,initialMotherName: null == initialMotherName ? _self.initialMotherName : initialMotherName // ignore: cast_nullable_to_non_nullable
as String,initialFatherName: null == initialFatherName ? _self.initialFatherName : initialFatherName // ignore: cast_nullable_to_non_nullable
as String,initialBirthDate: freezed == initialBirthDate ? _self.initialBirthDate : initialBirthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,firstNameError: freezed == firstNameError ? _self.firstNameError : firstNameError // ignore: cast_nullable_to_non_nullable
as String?,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,lastNameError: freezed == lastNameError ? _self.lastNameError : lastNameError // ignore: cast_nullable_to_non_nullable
as String?,motherName: null == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String,motherNameError: freezed == motherNameError ? _self.motherNameError : motherNameError // ignore: cast_nullable_to_non_nullable
as String?,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,fatherNameError: freezed == fatherNameError ? _self.fatherNameError : fatherNameError // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,shouldConfirmDuplicate: null == shouldConfirmDuplicate ? _self.shouldConfirmDuplicate : shouldConfirmDuplicate // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Result,
  ));
}

/// Create a copy of TeacherState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res> get status {
  
  return $ResultCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
