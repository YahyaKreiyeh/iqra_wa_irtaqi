// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'center_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CenterState {

 String get id; bool get isEditing; String get initialName; String get initialLocation; String get initialNotes; String get name; String? get nameErrorKey; String get location; String? get locationErrorKey; String get notes; Result get status; String? get initialManagerId; String? get managerId; Result<List<Teacher>> get managersResult;
/// Create a copy of CenterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CenterStateCopyWith<CenterState> get copyWith => _$CenterStateCopyWithImpl<CenterState>(this as CenterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CenterState&&(identical(other.id, id) || other.id == id)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.initialName, initialName) || other.initialName == initialName)&&(identical(other.initialLocation, initialLocation) || other.initialLocation == initialLocation)&&(identical(other.initialNotes, initialNotes) || other.initialNotes == initialNotes)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameErrorKey, nameErrorKey) || other.nameErrorKey == nameErrorKey)&&(identical(other.location, location) || other.location == location)&&(identical(other.locationErrorKey, locationErrorKey) || other.locationErrorKey == locationErrorKey)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.initialManagerId, initialManagerId) || other.initialManagerId == initialManagerId)&&(identical(other.managerId, managerId) || other.managerId == managerId)&&(identical(other.managersResult, managersResult) || other.managersResult == managersResult));
}


@override
int get hashCode => Object.hash(runtimeType,id,isEditing,initialName,initialLocation,initialNotes,name,nameErrorKey,location,locationErrorKey,notes,status,initialManagerId,managerId,managersResult);

@override
String toString() {
  return 'CenterState(id: $id, isEditing: $isEditing, initialName: $initialName, initialLocation: $initialLocation, initialNotes: $initialNotes, name: $name, nameErrorKey: $nameErrorKey, location: $location, locationErrorKey: $locationErrorKey, notes: $notes, status: $status, initialManagerId: $initialManagerId, managerId: $managerId, managersResult: $managersResult)';
}


}

/// @nodoc
abstract mixin class $CenterStateCopyWith<$Res>  {
  factory $CenterStateCopyWith(CenterState value, $Res Function(CenterState) _then) = _$CenterStateCopyWithImpl;
@useResult
$Res call({
 String id, bool isEditing, String initialName, String initialLocation, String initialNotes, String name, String? nameErrorKey, String location, String? locationErrorKey, String notes, Result status, String? initialManagerId, String? managerId, Result<List<Teacher>> managersResult
});


$ResultCopyWith<dynamic, $Res> get status;$ResultCopyWith<List<Teacher>, $Res> get managersResult;

}
/// @nodoc
class _$CenterStateCopyWithImpl<$Res>
    implements $CenterStateCopyWith<$Res> {
  _$CenterStateCopyWithImpl(this._self, this._then);

  final CenterState _self;
  final $Res Function(CenterState) _then;

/// Create a copy of CenterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isEditing = null,Object? initialName = null,Object? initialLocation = null,Object? initialNotes = null,Object? name = null,Object? nameErrorKey = freezed,Object? location = null,Object? locationErrorKey = freezed,Object? notes = null,Object? status = null,Object? initialManagerId = freezed,Object? managerId = freezed,Object? managersResult = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,initialName: null == initialName ? _self.initialName : initialName // ignore: cast_nullable_to_non_nullable
as String,initialLocation: null == initialLocation ? _self.initialLocation : initialLocation // ignore: cast_nullable_to_non_nullable
as String,initialNotes: null == initialNotes ? _self.initialNotes : initialNotes // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameErrorKey: freezed == nameErrorKey ? _self.nameErrorKey : nameErrorKey // ignore: cast_nullable_to_non_nullable
as String?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,locationErrorKey: freezed == locationErrorKey ? _self.locationErrorKey : locationErrorKey // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Result,initialManagerId: freezed == initialManagerId ? _self.initialManagerId : initialManagerId // ignore: cast_nullable_to_non_nullable
as String?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as String?,managersResult: null == managersResult ? _self.managersResult : managersResult // ignore: cast_nullable_to_non_nullable
as Result<List<Teacher>>,
  ));
}
/// Create a copy of CenterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res> get status {
  
  return $ResultCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of CenterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<List<Teacher>, $Res> get managersResult {
  
  return $ResultCopyWith<List<Teacher>, $Res>(_self.managersResult, (value) {
    return _then(_self.copyWith(managersResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [CenterState].
extension CenterStatePatterns on CenterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CenterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CenterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CenterState value)  $default,){
final _that = this;
switch (_that) {
case _CenterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CenterState value)?  $default,){
final _that = this;
switch (_that) {
case _CenterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool isEditing,  String initialName,  String initialLocation,  String initialNotes,  String name,  String? nameErrorKey,  String location,  String? locationErrorKey,  String notes,  Result status,  String? initialManagerId,  String? managerId,  Result<List<Teacher>> managersResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CenterState() when $default != null:
return $default(_that.id,_that.isEditing,_that.initialName,_that.initialLocation,_that.initialNotes,_that.name,_that.nameErrorKey,_that.location,_that.locationErrorKey,_that.notes,_that.status,_that.initialManagerId,_that.managerId,_that.managersResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool isEditing,  String initialName,  String initialLocation,  String initialNotes,  String name,  String? nameErrorKey,  String location,  String? locationErrorKey,  String notes,  Result status,  String? initialManagerId,  String? managerId,  Result<List<Teacher>> managersResult)  $default,) {final _that = this;
switch (_that) {
case _CenterState():
return $default(_that.id,_that.isEditing,_that.initialName,_that.initialLocation,_that.initialNotes,_that.name,_that.nameErrorKey,_that.location,_that.locationErrorKey,_that.notes,_that.status,_that.initialManagerId,_that.managerId,_that.managersResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool isEditing,  String initialName,  String initialLocation,  String initialNotes,  String name,  String? nameErrorKey,  String location,  String? locationErrorKey,  String notes,  Result status,  String? initialManagerId,  String? managerId,  Result<List<Teacher>> managersResult)?  $default,) {final _that = this;
switch (_that) {
case _CenterState() when $default != null:
return $default(_that.id,_that.isEditing,_that.initialName,_that.initialLocation,_that.initialNotes,_that.name,_that.nameErrorKey,_that.location,_that.locationErrorKey,_that.notes,_that.status,_that.initialManagerId,_that.managerId,_that.managersResult);case _:
  return null;

}
}

}

/// @nodoc


class _CenterState implements CenterState {
   _CenterState({this.id = '', this.isEditing = false, this.initialName = '', this.initialLocation = '', this.initialNotes = '', this.name = '', this.nameErrorKey, this.location = '', this.locationErrorKey, this.notes = '', this.status = const Result.empty(), this.initialManagerId, this.managerId, this.managersResult = const Result<List<Teacher>>.empty()});
  

@override@JsonKey() final  String id;
@override@JsonKey() final  bool isEditing;
@override@JsonKey() final  String initialName;
@override@JsonKey() final  String initialLocation;
@override@JsonKey() final  String initialNotes;
@override@JsonKey() final  String name;
@override final  String? nameErrorKey;
@override@JsonKey() final  String location;
@override final  String? locationErrorKey;
@override@JsonKey() final  String notes;
@override@JsonKey() final  Result status;
@override final  String? initialManagerId;
@override final  String? managerId;
@override@JsonKey() final  Result<List<Teacher>> managersResult;

/// Create a copy of CenterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CenterStateCopyWith<_CenterState> get copyWith => __$CenterStateCopyWithImpl<_CenterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CenterState&&(identical(other.id, id) || other.id == id)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.initialName, initialName) || other.initialName == initialName)&&(identical(other.initialLocation, initialLocation) || other.initialLocation == initialLocation)&&(identical(other.initialNotes, initialNotes) || other.initialNotes == initialNotes)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameErrorKey, nameErrorKey) || other.nameErrorKey == nameErrorKey)&&(identical(other.location, location) || other.location == location)&&(identical(other.locationErrorKey, locationErrorKey) || other.locationErrorKey == locationErrorKey)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.initialManagerId, initialManagerId) || other.initialManagerId == initialManagerId)&&(identical(other.managerId, managerId) || other.managerId == managerId)&&(identical(other.managersResult, managersResult) || other.managersResult == managersResult));
}


@override
int get hashCode => Object.hash(runtimeType,id,isEditing,initialName,initialLocation,initialNotes,name,nameErrorKey,location,locationErrorKey,notes,status,initialManagerId,managerId,managersResult);

@override
String toString() {
  return 'CenterState(id: $id, isEditing: $isEditing, initialName: $initialName, initialLocation: $initialLocation, initialNotes: $initialNotes, name: $name, nameErrorKey: $nameErrorKey, location: $location, locationErrorKey: $locationErrorKey, notes: $notes, status: $status, initialManagerId: $initialManagerId, managerId: $managerId, managersResult: $managersResult)';
}


}

/// @nodoc
abstract mixin class _$CenterStateCopyWith<$Res> implements $CenterStateCopyWith<$Res> {
  factory _$CenterStateCopyWith(_CenterState value, $Res Function(_CenterState) _then) = __$CenterStateCopyWithImpl;
@override @useResult
$Res call({
 String id, bool isEditing, String initialName, String initialLocation, String initialNotes, String name, String? nameErrorKey, String location, String? locationErrorKey, String notes, Result status, String? initialManagerId, String? managerId, Result<List<Teacher>> managersResult
});


@override $ResultCopyWith<dynamic, $Res> get status;@override $ResultCopyWith<List<Teacher>, $Res> get managersResult;

}
/// @nodoc
class __$CenterStateCopyWithImpl<$Res>
    implements _$CenterStateCopyWith<$Res> {
  __$CenterStateCopyWithImpl(this._self, this._then);

  final _CenterState _self;
  final $Res Function(_CenterState) _then;

/// Create a copy of CenterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isEditing = null,Object? initialName = null,Object? initialLocation = null,Object? initialNotes = null,Object? name = null,Object? nameErrorKey = freezed,Object? location = null,Object? locationErrorKey = freezed,Object? notes = null,Object? status = null,Object? initialManagerId = freezed,Object? managerId = freezed,Object? managersResult = null,}) {
  return _then(_CenterState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,initialName: null == initialName ? _self.initialName : initialName // ignore: cast_nullable_to_non_nullable
as String,initialLocation: null == initialLocation ? _self.initialLocation : initialLocation // ignore: cast_nullable_to_non_nullable
as String,initialNotes: null == initialNotes ? _self.initialNotes : initialNotes // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameErrorKey: freezed == nameErrorKey ? _self.nameErrorKey : nameErrorKey // ignore: cast_nullable_to_non_nullable
as String?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,locationErrorKey: freezed == locationErrorKey ? _self.locationErrorKey : locationErrorKey // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Result,initialManagerId: freezed == initialManagerId ? _self.initialManagerId : initialManagerId // ignore: cast_nullable_to_non_nullable
as String?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as String?,managersResult: null == managersResult ? _self.managersResult : managersResult // ignore: cast_nullable_to_non_nullable
as Result<List<Teacher>>,
  ));
}

/// Create a copy of CenterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res> get status {
  
  return $ResultCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of CenterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<List<Teacher>, $Res> get managersResult {
  
  return $ResultCopyWith<List<Teacher>, $Res>(_self.managersResult, (value) {
    return _then(_self.copyWith(managersResult: value));
  });
}
}

// dart format on
