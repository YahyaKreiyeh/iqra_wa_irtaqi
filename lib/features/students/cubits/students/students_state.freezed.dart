// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'students_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentsState {

 List<Student> get students; DocumentSnapshot<Map<String, dynamic>>? get lastDoc; bool get hasReachedMax; bool get isLoading; String? get errorMessage; bool get isSelecting; Set<String> get selectedIds; String get query; Institute? get institute; int get totalCount;
/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentsStateCopyWith<StudentsState> get copyWith => _$StudentsStateCopyWithImpl<StudentsState>(this as StudentsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentsState&&const DeepCollectionEquality().equals(other.students, students)&&(identical(other.lastDoc, lastDoc) || other.lastDoc == lastDoc)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSelecting, isSelecting) || other.isSelecting == isSelecting)&&const DeepCollectionEquality().equals(other.selectedIds, selectedIds)&&(identical(other.query, query) || other.query == query)&&(identical(other.institute, institute) || other.institute == institute)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(students),lastDoc,hasReachedMax,isLoading,errorMessage,isSelecting,const DeepCollectionEquality().hash(selectedIds),query,institute,totalCount);

@override
String toString() {
  return 'StudentsState(students: $students, lastDoc: $lastDoc, hasReachedMax: $hasReachedMax, isLoading: $isLoading, errorMessage: $errorMessage, isSelecting: $isSelecting, selectedIds: $selectedIds, query: $query, institute: $institute, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $StudentsStateCopyWith<$Res>  {
  factory $StudentsStateCopyWith(StudentsState value, $Res Function(StudentsState) _then) = _$StudentsStateCopyWithImpl;
@useResult
$Res call({
 List<Student> students, DocumentSnapshot<Map<String, dynamic>>? lastDoc, bool hasReachedMax, bool isLoading, String? errorMessage, bool isSelecting, Set<String> selectedIds, String query, Institute? institute, int totalCount
});


$InstituteCopyWith<$Res>? get institute;

}
/// @nodoc
class _$StudentsStateCopyWithImpl<$Res>
    implements $StudentsStateCopyWith<$Res> {
  _$StudentsStateCopyWithImpl(this._self, this._then);

  final StudentsState _self;
  final $Res Function(StudentsState) _then;

/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? students = null,Object? lastDoc = freezed,Object? hasReachedMax = null,Object? isLoading = null,Object? errorMessage = freezed,Object? isSelecting = null,Object? selectedIds = null,Object? query = null,Object? institute = freezed,Object? totalCount = null,}) {
  return _then(_self.copyWith(
students: null == students ? _self.students : students // ignore: cast_nullable_to_non_nullable
as List<Student>,lastDoc: freezed == lastDoc ? _self.lastDoc : lastDoc // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot<Map<String, dynamic>>?,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSelecting: null == isSelecting ? _self.isSelecting : isSelecting // ignore: cast_nullable_to_non_nullable
as bool,selectedIds: null == selectedIds ? _self.selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,institute: freezed == institute ? _self.institute : institute // ignore: cast_nullable_to_non_nullable
as Institute?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InstituteCopyWith<$Res>? get institute {
    if (_self.institute == null) {
    return null;
  }

  return $InstituteCopyWith<$Res>(_self.institute!, (value) {
    return _then(_self.copyWith(institute: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudentsState].
extension StudentsStatePatterns on StudentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentsState value)  $default,){
final _that = this;
switch (_that) {
case _StudentsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentsState value)?  $default,){
final _that = this;
switch (_that) {
case _StudentsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Student> students,  DocumentSnapshot<Map<String, dynamic>>? lastDoc,  bool hasReachedMax,  bool isLoading,  String? errorMessage,  bool isSelecting,  Set<String> selectedIds,  String query,  Institute? institute,  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentsState() when $default != null:
return $default(_that.students,_that.lastDoc,_that.hasReachedMax,_that.isLoading,_that.errorMessage,_that.isSelecting,_that.selectedIds,_that.query,_that.institute,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Student> students,  DocumentSnapshot<Map<String, dynamic>>? lastDoc,  bool hasReachedMax,  bool isLoading,  String? errorMessage,  bool isSelecting,  Set<String> selectedIds,  String query,  Institute? institute,  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _StudentsState():
return $default(_that.students,_that.lastDoc,_that.hasReachedMax,_that.isLoading,_that.errorMessage,_that.isSelecting,_that.selectedIds,_that.query,_that.institute,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Student> students,  DocumentSnapshot<Map<String, dynamic>>? lastDoc,  bool hasReachedMax,  bool isLoading,  String? errorMessage,  bool isSelecting,  Set<String> selectedIds,  String query,  Institute? institute,  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _StudentsState() when $default != null:
return $default(_that.students,_that.lastDoc,_that.hasReachedMax,_that.isLoading,_that.errorMessage,_that.isSelecting,_that.selectedIds,_that.query,_that.institute,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc


class _StudentsState implements StudentsState {
  const _StudentsState({final  List<Student> students = const <Student>[], this.lastDoc, this.hasReachedMax = false, this.isLoading = false, this.errorMessage, this.isSelecting = false, final  Set<String> selectedIds = const <String>{}, this.query = '', this.institute, this.totalCount = 0}): _students = students,_selectedIds = selectedIds;
  

 final  List<Student> _students;
@override@JsonKey() List<Student> get students {
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_students);
}

@override final  DocumentSnapshot<Map<String, dynamic>>? lastDoc;
@override@JsonKey() final  bool hasReachedMax;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  bool isSelecting;
 final  Set<String> _selectedIds;
@override@JsonKey() Set<String> get selectedIds {
  if (_selectedIds is EqualUnmodifiableSetView) return _selectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedIds);
}

@override@JsonKey() final  String query;
@override final  Institute? institute;
@override@JsonKey() final  int totalCount;

/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentsStateCopyWith<_StudentsState> get copyWith => __$StudentsStateCopyWithImpl<_StudentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentsState&&const DeepCollectionEquality().equals(other._students, _students)&&(identical(other.lastDoc, lastDoc) || other.lastDoc == lastDoc)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSelecting, isSelecting) || other.isSelecting == isSelecting)&&const DeepCollectionEquality().equals(other._selectedIds, _selectedIds)&&(identical(other.query, query) || other.query == query)&&(identical(other.institute, institute) || other.institute == institute)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_students),lastDoc,hasReachedMax,isLoading,errorMessage,isSelecting,const DeepCollectionEquality().hash(_selectedIds),query,institute,totalCount);

@override
String toString() {
  return 'StudentsState(students: $students, lastDoc: $lastDoc, hasReachedMax: $hasReachedMax, isLoading: $isLoading, errorMessage: $errorMessage, isSelecting: $isSelecting, selectedIds: $selectedIds, query: $query, institute: $institute, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$StudentsStateCopyWith<$Res> implements $StudentsStateCopyWith<$Res> {
  factory _$StudentsStateCopyWith(_StudentsState value, $Res Function(_StudentsState) _then) = __$StudentsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Student> students, DocumentSnapshot<Map<String, dynamic>>? lastDoc, bool hasReachedMax, bool isLoading, String? errorMessage, bool isSelecting, Set<String> selectedIds, String query, Institute? institute, int totalCount
});


@override $InstituteCopyWith<$Res>? get institute;

}
/// @nodoc
class __$StudentsStateCopyWithImpl<$Res>
    implements _$StudentsStateCopyWith<$Res> {
  __$StudentsStateCopyWithImpl(this._self, this._then);

  final _StudentsState _self;
  final $Res Function(_StudentsState) _then;

/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? students = null,Object? lastDoc = freezed,Object? hasReachedMax = null,Object? isLoading = null,Object? errorMessage = freezed,Object? isSelecting = null,Object? selectedIds = null,Object? query = null,Object? institute = freezed,Object? totalCount = null,}) {
  return _then(_StudentsState(
students: null == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<Student>,lastDoc: freezed == lastDoc ? _self.lastDoc : lastDoc // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot<Map<String, dynamic>>?,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSelecting: null == isSelecting ? _self.isSelecting : isSelecting // ignore: cast_nullable_to_non_nullable
as bool,selectedIds: null == selectedIds ? _self._selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,institute: freezed == institute ? _self.institute : institute // ignore: cast_nullable_to_non_nullable
as Institute?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of StudentsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InstituteCopyWith<$Res>? get institute {
    if (_self.institute == null) {
    return null;
  }

  return $InstituteCopyWith<$Res>(_self.institute!, (value) {
    return _then(_self.copyWith(institute: value));
  });
}
}

// dart format on
