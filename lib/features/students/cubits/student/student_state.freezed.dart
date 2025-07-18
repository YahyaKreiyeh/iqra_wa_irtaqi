// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentState {

 String get id; bool get isEditing; String get initialFirstName; String get initialLastName; String get initialMotherName; String get initialFatherName; DateTime? get initialBirthDate; String? get initialInstituteId; String get firstName; String? get firstNameError; String get lastName; String? get lastNameError; String get motherName; String? get motherNameError; String get fatherName; String? get fatherNameError; DateTime? get birthDate; String? get instituteId; Result<List<Institute>> get institutesResult; bool get nominatedGhaibi; bool get nominatedNazari; bool get nominatedHadith; bool? get examPassedGhaibi; String? get examGhaibiError; bool? get examPassedNazari; String? get examNazariError; bool? get examPassedHadith; String? get examHadithError; bool get shouldConfirmDuplicate; Result get status;
/// Create a copy of StudentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentStateCopyWith<StudentState> get copyWith => _$StudentStateCopyWithImpl<StudentState>(this as StudentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentState&&(identical(other.id, id) || other.id == id)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.initialFirstName, initialFirstName) || other.initialFirstName == initialFirstName)&&(identical(other.initialLastName, initialLastName) || other.initialLastName == initialLastName)&&(identical(other.initialMotherName, initialMotherName) || other.initialMotherName == initialMotherName)&&(identical(other.initialFatherName, initialFatherName) || other.initialFatherName == initialFatherName)&&(identical(other.initialBirthDate, initialBirthDate) || other.initialBirthDate == initialBirthDate)&&(identical(other.initialInstituteId, initialInstituteId) || other.initialInstituteId == initialInstituteId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.firstNameError, firstNameError) || other.firstNameError == firstNameError)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.lastNameError, lastNameError) || other.lastNameError == lastNameError)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.motherNameError, motherNameError) || other.motherNameError == motherNameError)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.fatherNameError, fatherNameError) || other.fatherNameError == fatherNameError)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.instituteId, instituteId) || other.instituteId == instituteId)&&(identical(other.institutesResult, institutesResult) || other.institutesResult == institutesResult)&&(identical(other.nominatedGhaibi, nominatedGhaibi) || other.nominatedGhaibi == nominatedGhaibi)&&(identical(other.nominatedNazari, nominatedNazari) || other.nominatedNazari == nominatedNazari)&&(identical(other.nominatedHadith, nominatedHadith) || other.nominatedHadith == nominatedHadith)&&(identical(other.examPassedGhaibi, examPassedGhaibi) || other.examPassedGhaibi == examPassedGhaibi)&&(identical(other.examGhaibiError, examGhaibiError) || other.examGhaibiError == examGhaibiError)&&(identical(other.examPassedNazari, examPassedNazari) || other.examPassedNazari == examPassedNazari)&&(identical(other.examNazariError, examNazariError) || other.examNazariError == examNazariError)&&(identical(other.examPassedHadith, examPassedHadith) || other.examPassedHadith == examPassedHadith)&&(identical(other.examHadithError, examHadithError) || other.examHadithError == examHadithError)&&(identical(other.shouldConfirmDuplicate, shouldConfirmDuplicate) || other.shouldConfirmDuplicate == shouldConfirmDuplicate)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,isEditing,initialFirstName,initialLastName,initialMotherName,initialFatherName,initialBirthDate,initialInstituteId,firstName,firstNameError,lastName,lastNameError,motherName,motherNameError,fatherName,fatherNameError,birthDate,instituteId,institutesResult,nominatedGhaibi,nominatedNazari,nominatedHadith,examPassedGhaibi,examGhaibiError,examPassedNazari,examNazariError,examPassedHadith,examHadithError,shouldConfirmDuplicate,status]);

@override
String toString() {
  return 'StudentState(id: $id, isEditing: $isEditing, initialFirstName: $initialFirstName, initialLastName: $initialLastName, initialMotherName: $initialMotherName, initialFatherName: $initialFatherName, initialBirthDate: $initialBirthDate, initialInstituteId: $initialInstituteId, firstName: $firstName, firstNameError: $firstNameError, lastName: $lastName, lastNameError: $lastNameError, motherName: $motherName, motherNameError: $motherNameError, fatherName: $fatherName, fatherNameError: $fatherNameError, birthDate: $birthDate, instituteId: $instituteId, institutesResult: $institutesResult, nominatedGhaibi: $nominatedGhaibi, nominatedNazari: $nominatedNazari, nominatedHadith: $nominatedHadith, examPassedGhaibi: $examPassedGhaibi, examGhaibiError: $examGhaibiError, examPassedNazari: $examPassedNazari, examNazariError: $examNazariError, examPassedHadith: $examPassedHadith, examHadithError: $examHadithError, shouldConfirmDuplicate: $shouldConfirmDuplicate, status: $status)';
}


}

/// @nodoc
abstract mixin class $StudentStateCopyWith<$Res>  {
  factory $StudentStateCopyWith(StudentState value, $Res Function(StudentState) _then) = _$StudentStateCopyWithImpl;
@useResult
$Res call({
 String id, bool isEditing, String initialFirstName, String initialLastName, String initialMotherName, String initialFatherName, DateTime? initialBirthDate, String? initialInstituteId, String firstName, String? firstNameError, String lastName, String? lastNameError, String motherName, String? motherNameError, String fatherName, String? fatherNameError, DateTime? birthDate, String? instituteId, Result<List<Institute>> institutesResult, bool nominatedGhaibi, bool nominatedNazari, bool nominatedHadith, bool? examPassedGhaibi, String? examGhaibiError, bool? examPassedNazari, String? examNazariError, bool? examPassedHadith, String? examHadithError, bool shouldConfirmDuplicate, Result status
});


$ResultCopyWith<List<Institute>, $Res> get institutesResult;$ResultCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class _$StudentStateCopyWithImpl<$Res>
    implements $StudentStateCopyWith<$Res> {
  _$StudentStateCopyWithImpl(this._self, this._then);

  final StudentState _self;
  final $Res Function(StudentState) _then;

/// Create a copy of StudentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isEditing = null,Object? initialFirstName = null,Object? initialLastName = null,Object? initialMotherName = null,Object? initialFatherName = null,Object? initialBirthDate = freezed,Object? initialInstituteId = freezed,Object? firstName = null,Object? firstNameError = freezed,Object? lastName = null,Object? lastNameError = freezed,Object? motherName = null,Object? motherNameError = freezed,Object? fatherName = null,Object? fatherNameError = freezed,Object? birthDate = freezed,Object? instituteId = freezed,Object? institutesResult = null,Object? nominatedGhaibi = null,Object? nominatedNazari = null,Object? nominatedHadith = null,Object? examPassedGhaibi = freezed,Object? examGhaibiError = freezed,Object? examPassedNazari = freezed,Object? examNazariError = freezed,Object? examPassedHadith = freezed,Object? examHadithError = freezed,Object? shouldConfirmDuplicate = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,initialFirstName: null == initialFirstName ? _self.initialFirstName : initialFirstName // ignore: cast_nullable_to_non_nullable
as String,initialLastName: null == initialLastName ? _self.initialLastName : initialLastName // ignore: cast_nullable_to_non_nullable
as String,initialMotherName: null == initialMotherName ? _self.initialMotherName : initialMotherName // ignore: cast_nullable_to_non_nullable
as String,initialFatherName: null == initialFatherName ? _self.initialFatherName : initialFatherName // ignore: cast_nullable_to_non_nullable
as String,initialBirthDate: freezed == initialBirthDate ? _self.initialBirthDate : initialBirthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,initialInstituteId: freezed == initialInstituteId ? _self.initialInstituteId : initialInstituteId // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,firstNameError: freezed == firstNameError ? _self.firstNameError : firstNameError // ignore: cast_nullable_to_non_nullable
as String?,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,lastNameError: freezed == lastNameError ? _self.lastNameError : lastNameError // ignore: cast_nullable_to_non_nullable
as String?,motherName: null == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String,motherNameError: freezed == motherNameError ? _self.motherNameError : motherNameError // ignore: cast_nullable_to_non_nullable
as String?,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,fatherNameError: freezed == fatherNameError ? _self.fatherNameError : fatherNameError // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,instituteId: freezed == instituteId ? _self.instituteId : instituteId // ignore: cast_nullable_to_non_nullable
as String?,institutesResult: null == institutesResult ? _self.institutesResult : institutesResult // ignore: cast_nullable_to_non_nullable
as Result<List<Institute>>,nominatedGhaibi: null == nominatedGhaibi ? _self.nominatedGhaibi : nominatedGhaibi // ignore: cast_nullable_to_non_nullable
as bool,nominatedNazari: null == nominatedNazari ? _self.nominatedNazari : nominatedNazari // ignore: cast_nullable_to_non_nullable
as bool,nominatedHadith: null == nominatedHadith ? _self.nominatedHadith : nominatedHadith // ignore: cast_nullable_to_non_nullable
as bool,examPassedGhaibi: freezed == examPassedGhaibi ? _self.examPassedGhaibi : examPassedGhaibi // ignore: cast_nullable_to_non_nullable
as bool?,examGhaibiError: freezed == examGhaibiError ? _self.examGhaibiError : examGhaibiError // ignore: cast_nullable_to_non_nullable
as String?,examPassedNazari: freezed == examPassedNazari ? _self.examPassedNazari : examPassedNazari // ignore: cast_nullable_to_non_nullable
as bool?,examNazariError: freezed == examNazariError ? _self.examNazariError : examNazariError // ignore: cast_nullable_to_non_nullable
as String?,examPassedHadith: freezed == examPassedHadith ? _self.examPassedHadith : examPassedHadith // ignore: cast_nullable_to_non_nullable
as bool?,examHadithError: freezed == examHadithError ? _self.examHadithError : examHadithError // ignore: cast_nullable_to_non_nullable
as String?,shouldConfirmDuplicate: null == shouldConfirmDuplicate ? _self.shouldConfirmDuplicate : shouldConfirmDuplicate // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Result,
  ));
}
/// Create a copy of StudentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<List<Institute>, $Res> get institutesResult {
  
  return $ResultCopyWith<List<Institute>, $Res>(_self.institutesResult, (value) {
    return _then(_self.copyWith(institutesResult: value));
  });
}/// Create a copy of StudentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res> get status {
  
  return $ResultCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudentState].
extension StudentStatePatterns on StudentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentState value)  $default,){
final _that = this;
switch (_that) {
case _StudentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentState value)?  $default,){
final _that = this;
switch (_that) {
case _StudentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool isEditing,  String initialFirstName,  String initialLastName,  String initialMotherName,  String initialFatherName,  DateTime? initialBirthDate,  String? initialInstituteId,  String firstName,  String? firstNameError,  String lastName,  String? lastNameError,  String motherName,  String? motherNameError,  String fatherName,  String? fatherNameError,  DateTime? birthDate,  String? instituteId,  Result<List<Institute>> institutesResult,  bool nominatedGhaibi,  bool nominatedNazari,  bool nominatedHadith,  bool? examPassedGhaibi,  String? examGhaibiError,  bool? examPassedNazari,  String? examNazariError,  bool? examPassedHadith,  String? examHadithError,  bool shouldConfirmDuplicate,  Result status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentState() when $default != null:
return $default(_that.id,_that.isEditing,_that.initialFirstName,_that.initialLastName,_that.initialMotherName,_that.initialFatherName,_that.initialBirthDate,_that.initialInstituteId,_that.firstName,_that.firstNameError,_that.lastName,_that.lastNameError,_that.motherName,_that.motherNameError,_that.fatherName,_that.fatherNameError,_that.birthDate,_that.instituteId,_that.institutesResult,_that.nominatedGhaibi,_that.nominatedNazari,_that.nominatedHadith,_that.examPassedGhaibi,_that.examGhaibiError,_that.examPassedNazari,_that.examNazariError,_that.examPassedHadith,_that.examHadithError,_that.shouldConfirmDuplicate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool isEditing,  String initialFirstName,  String initialLastName,  String initialMotherName,  String initialFatherName,  DateTime? initialBirthDate,  String? initialInstituteId,  String firstName,  String? firstNameError,  String lastName,  String? lastNameError,  String motherName,  String? motherNameError,  String fatherName,  String? fatherNameError,  DateTime? birthDate,  String? instituteId,  Result<List<Institute>> institutesResult,  bool nominatedGhaibi,  bool nominatedNazari,  bool nominatedHadith,  bool? examPassedGhaibi,  String? examGhaibiError,  bool? examPassedNazari,  String? examNazariError,  bool? examPassedHadith,  String? examHadithError,  bool shouldConfirmDuplicate,  Result status)  $default,) {final _that = this;
switch (_that) {
case _StudentState():
return $default(_that.id,_that.isEditing,_that.initialFirstName,_that.initialLastName,_that.initialMotherName,_that.initialFatherName,_that.initialBirthDate,_that.initialInstituteId,_that.firstName,_that.firstNameError,_that.lastName,_that.lastNameError,_that.motherName,_that.motherNameError,_that.fatherName,_that.fatherNameError,_that.birthDate,_that.instituteId,_that.institutesResult,_that.nominatedGhaibi,_that.nominatedNazari,_that.nominatedHadith,_that.examPassedGhaibi,_that.examGhaibiError,_that.examPassedNazari,_that.examNazariError,_that.examPassedHadith,_that.examHadithError,_that.shouldConfirmDuplicate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool isEditing,  String initialFirstName,  String initialLastName,  String initialMotherName,  String initialFatherName,  DateTime? initialBirthDate,  String? initialInstituteId,  String firstName,  String? firstNameError,  String lastName,  String? lastNameError,  String motherName,  String? motherNameError,  String fatherName,  String? fatherNameError,  DateTime? birthDate,  String? instituteId,  Result<List<Institute>> institutesResult,  bool nominatedGhaibi,  bool nominatedNazari,  bool nominatedHadith,  bool? examPassedGhaibi,  String? examGhaibiError,  bool? examPassedNazari,  String? examNazariError,  bool? examPassedHadith,  String? examHadithError,  bool shouldConfirmDuplicate,  Result status)?  $default,) {final _that = this;
switch (_that) {
case _StudentState() when $default != null:
return $default(_that.id,_that.isEditing,_that.initialFirstName,_that.initialLastName,_that.initialMotherName,_that.initialFatherName,_that.initialBirthDate,_that.initialInstituteId,_that.firstName,_that.firstNameError,_that.lastName,_that.lastNameError,_that.motherName,_that.motherNameError,_that.fatherName,_that.fatherNameError,_that.birthDate,_that.instituteId,_that.institutesResult,_that.nominatedGhaibi,_that.nominatedNazari,_that.nominatedHadith,_that.examPassedGhaibi,_that.examGhaibiError,_that.examPassedNazari,_that.examNazariError,_that.examPassedHadith,_that.examHadithError,_that.shouldConfirmDuplicate,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _StudentState implements StudentState {
   _StudentState({this.id = '', this.isEditing = false, this.initialFirstName = '', this.initialLastName = '', this.initialMotherName = '', this.initialFatherName = '', this.initialBirthDate, this.initialInstituteId, this.firstName = '', this.firstNameError, this.lastName = '', this.lastNameError, this.motherName = '', this.motherNameError, this.fatherName = '', this.fatherNameError, this.birthDate, this.instituteId, this.institutesResult = const Result<List<Institute>>.empty(), this.nominatedGhaibi = false, this.nominatedNazari = false, this.nominatedHadith = false, this.examPassedGhaibi, this.examGhaibiError, this.examPassedNazari, this.examNazariError, this.examPassedHadith, this.examHadithError, this.shouldConfirmDuplicate = false, this.status = const Result.empty()});
  

@override@JsonKey() final  String id;
@override@JsonKey() final  bool isEditing;
@override@JsonKey() final  String initialFirstName;
@override@JsonKey() final  String initialLastName;
@override@JsonKey() final  String initialMotherName;
@override@JsonKey() final  String initialFatherName;
@override final  DateTime? initialBirthDate;
@override final  String? initialInstituteId;
@override@JsonKey() final  String firstName;
@override final  String? firstNameError;
@override@JsonKey() final  String lastName;
@override final  String? lastNameError;
@override@JsonKey() final  String motherName;
@override final  String? motherNameError;
@override@JsonKey() final  String fatherName;
@override final  String? fatherNameError;
@override final  DateTime? birthDate;
@override final  String? instituteId;
@override@JsonKey() final  Result<List<Institute>> institutesResult;
@override@JsonKey() final  bool nominatedGhaibi;
@override@JsonKey() final  bool nominatedNazari;
@override@JsonKey() final  bool nominatedHadith;
@override final  bool? examPassedGhaibi;
@override final  String? examGhaibiError;
@override final  bool? examPassedNazari;
@override final  String? examNazariError;
@override final  bool? examPassedHadith;
@override final  String? examHadithError;
@override@JsonKey() final  bool shouldConfirmDuplicate;
@override@JsonKey() final  Result status;

/// Create a copy of StudentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentStateCopyWith<_StudentState> get copyWith => __$StudentStateCopyWithImpl<_StudentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentState&&(identical(other.id, id) || other.id == id)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.initialFirstName, initialFirstName) || other.initialFirstName == initialFirstName)&&(identical(other.initialLastName, initialLastName) || other.initialLastName == initialLastName)&&(identical(other.initialMotherName, initialMotherName) || other.initialMotherName == initialMotherName)&&(identical(other.initialFatherName, initialFatherName) || other.initialFatherName == initialFatherName)&&(identical(other.initialBirthDate, initialBirthDate) || other.initialBirthDate == initialBirthDate)&&(identical(other.initialInstituteId, initialInstituteId) || other.initialInstituteId == initialInstituteId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.firstNameError, firstNameError) || other.firstNameError == firstNameError)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.lastNameError, lastNameError) || other.lastNameError == lastNameError)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.motherNameError, motherNameError) || other.motherNameError == motherNameError)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.fatherNameError, fatherNameError) || other.fatherNameError == fatherNameError)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.instituteId, instituteId) || other.instituteId == instituteId)&&(identical(other.institutesResult, institutesResult) || other.institutesResult == institutesResult)&&(identical(other.nominatedGhaibi, nominatedGhaibi) || other.nominatedGhaibi == nominatedGhaibi)&&(identical(other.nominatedNazari, nominatedNazari) || other.nominatedNazari == nominatedNazari)&&(identical(other.nominatedHadith, nominatedHadith) || other.nominatedHadith == nominatedHadith)&&(identical(other.examPassedGhaibi, examPassedGhaibi) || other.examPassedGhaibi == examPassedGhaibi)&&(identical(other.examGhaibiError, examGhaibiError) || other.examGhaibiError == examGhaibiError)&&(identical(other.examPassedNazari, examPassedNazari) || other.examPassedNazari == examPassedNazari)&&(identical(other.examNazariError, examNazariError) || other.examNazariError == examNazariError)&&(identical(other.examPassedHadith, examPassedHadith) || other.examPassedHadith == examPassedHadith)&&(identical(other.examHadithError, examHadithError) || other.examHadithError == examHadithError)&&(identical(other.shouldConfirmDuplicate, shouldConfirmDuplicate) || other.shouldConfirmDuplicate == shouldConfirmDuplicate)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,isEditing,initialFirstName,initialLastName,initialMotherName,initialFatherName,initialBirthDate,initialInstituteId,firstName,firstNameError,lastName,lastNameError,motherName,motherNameError,fatherName,fatherNameError,birthDate,instituteId,institutesResult,nominatedGhaibi,nominatedNazari,nominatedHadith,examPassedGhaibi,examGhaibiError,examPassedNazari,examNazariError,examPassedHadith,examHadithError,shouldConfirmDuplicate,status]);

@override
String toString() {
  return 'StudentState(id: $id, isEditing: $isEditing, initialFirstName: $initialFirstName, initialLastName: $initialLastName, initialMotherName: $initialMotherName, initialFatherName: $initialFatherName, initialBirthDate: $initialBirthDate, initialInstituteId: $initialInstituteId, firstName: $firstName, firstNameError: $firstNameError, lastName: $lastName, lastNameError: $lastNameError, motherName: $motherName, motherNameError: $motherNameError, fatherName: $fatherName, fatherNameError: $fatherNameError, birthDate: $birthDate, instituteId: $instituteId, institutesResult: $institutesResult, nominatedGhaibi: $nominatedGhaibi, nominatedNazari: $nominatedNazari, nominatedHadith: $nominatedHadith, examPassedGhaibi: $examPassedGhaibi, examGhaibiError: $examGhaibiError, examPassedNazari: $examPassedNazari, examNazariError: $examNazariError, examPassedHadith: $examPassedHadith, examHadithError: $examHadithError, shouldConfirmDuplicate: $shouldConfirmDuplicate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$StudentStateCopyWith<$Res> implements $StudentStateCopyWith<$Res> {
  factory _$StudentStateCopyWith(_StudentState value, $Res Function(_StudentState) _then) = __$StudentStateCopyWithImpl;
@override @useResult
$Res call({
 String id, bool isEditing, String initialFirstName, String initialLastName, String initialMotherName, String initialFatherName, DateTime? initialBirthDate, String? initialInstituteId, String firstName, String? firstNameError, String lastName, String? lastNameError, String motherName, String? motherNameError, String fatherName, String? fatherNameError, DateTime? birthDate, String? instituteId, Result<List<Institute>> institutesResult, bool nominatedGhaibi, bool nominatedNazari, bool nominatedHadith, bool? examPassedGhaibi, String? examGhaibiError, bool? examPassedNazari, String? examNazariError, bool? examPassedHadith, String? examHadithError, bool shouldConfirmDuplicate, Result status
});


@override $ResultCopyWith<List<Institute>, $Res> get institutesResult;@override $ResultCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class __$StudentStateCopyWithImpl<$Res>
    implements _$StudentStateCopyWith<$Res> {
  __$StudentStateCopyWithImpl(this._self, this._then);

  final _StudentState _self;
  final $Res Function(_StudentState) _then;

/// Create a copy of StudentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isEditing = null,Object? initialFirstName = null,Object? initialLastName = null,Object? initialMotherName = null,Object? initialFatherName = null,Object? initialBirthDate = freezed,Object? initialInstituteId = freezed,Object? firstName = null,Object? firstNameError = freezed,Object? lastName = null,Object? lastNameError = freezed,Object? motherName = null,Object? motherNameError = freezed,Object? fatherName = null,Object? fatherNameError = freezed,Object? birthDate = freezed,Object? instituteId = freezed,Object? institutesResult = null,Object? nominatedGhaibi = null,Object? nominatedNazari = null,Object? nominatedHadith = null,Object? examPassedGhaibi = freezed,Object? examGhaibiError = freezed,Object? examPassedNazari = freezed,Object? examNazariError = freezed,Object? examPassedHadith = freezed,Object? examHadithError = freezed,Object? shouldConfirmDuplicate = null,Object? status = null,}) {
  return _then(_StudentState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,initialFirstName: null == initialFirstName ? _self.initialFirstName : initialFirstName // ignore: cast_nullable_to_non_nullable
as String,initialLastName: null == initialLastName ? _self.initialLastName : initialLastName // ignore: cast_nullable_to_non_nullable
as String,initialMotherName: null == initialMotherName ? _self.initialMotherName : initialMotherName // ignore: cast_nullable_to_non_nullable
as String,initialFatherName: null == initialFatherName ? _self.initialFatherName : initialFatherName // ignore: cast_nullable_to_non_nullable
as String,initialBirthDate: freezed == initialBirthDate ? _self.initialBirthDate : initialBirthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,initialInstituteId: freezed == initialInstituteId ? _self.initialInstituteId : initialInstituteId // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,firstNameError: freezed == firstNameError ? _self.firstNameError : firstNameError // ignore: cast_nullable_to_non_nullable
as String?,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,lastNameError: freezed == lastNameError ? _self.lastNameError : lastNameError // ignore: cast_nullable_to_non_nullable
as String?,motherName: null == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String,motherNameError: freezed == motherNameError ? _self.motherNameError : motherNameError // ignore: cast_nullable_to_non_nullable
as String?,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,fatherNameError: freezed == fatherNameError ? _self.fatherNameError : fatherNameError // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,instituteId: freezed == instituteId ? _self.instituteId : instituteId // ignore: cast_nullable_to_non_nullable
as String?,institutesResult: null == institutesResult ? _self.institutesResult : institutesResult // ignore: cast_nullable_to_non_nullable
as Result<List<Institute>>,nominatedGhaibi: null == nominatedGhaibi ? _self.nominatedGhaibi : nominatedGhaibi // ignore: cast_nullable_to_non_nullable
as bool,nominatedNazari: null == nominatedNazari ? _self.nominatedNazari : nominatedNazari // ignore: cast_nullable_to_non_nullable
as bool,nominatedHadith: null == nominatedHadith ? _self.nominatedHadith : nominatedHadith // ignore: cast_nullable_to_non_nullable
as bool,examPassedGhaibi: freezed == examPassedGhaibi ? _self.examPassedGhaibi : examPassedGhaibi // ignore: cast_nullable_to_non_nullable
as bool?,examGhaibiError: freezed == examGhaibiError ? _self.examGhaibiError : examGhaibiError // ignore: cast_nullable_to_non_nullable
as String?,examPassedNazari: freezed == examPassedNazari ? _self.examPassedNazari : examPassedNazari // ignore: cast_nullable_to_non_nullable
as bool?,examNazariError: freezed == examNazariError ? _self.examNazariError : examNazariError // ignore: cast_nullable_to_non_nullable
as String?,examPassedHadith: freezed == examPassedHadith ? _self.examPassedHadith : examPassedHadith // ignore: cast_nullable_to_non_nullable
as bool?,examHadithError: freezed == examHadithError ? _self.examHadithError : examHadithError // ignore: cast_nullable_to_non_nullable
as String?,shouldConfirmDuplicate: null == shouldConfirmDuplicate ? _self.shouldConfirmDuplicate : shouldConfirmDuplicate // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Result,
  ));
}

/// Create a copy of StudentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<List<Institute>, $Res> get institutesResult {
  
  return $ResultCopyWith<List<Institute>, $Res>(_self.institutesResult, (value) {
    return _then(_self.copyWith(institutesResult: value));
  });
}/// Create a copy of StudentState
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
