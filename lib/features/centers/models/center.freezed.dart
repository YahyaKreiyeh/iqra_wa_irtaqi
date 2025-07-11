// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'center.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Center {

 String get id; String get name; String get location; String? get notes; String? get managerId;
/// Create a copy of Center
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CenterCopyWith<Center> get copyWith => _$CenterCopyWithImpl<Center>(this as Center, _$identity);

  /// Serializes this Center to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Center&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.managerId, managerId) || other.managerId == managerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,notes,managerId);

@override
String toString() {
  return 'Center(id: $id, name: $name, location: $location, notes: $notes, managerId: $managerId)';
}


}

/// @nodoc
abstract mixin class $CenterCopyWith<$Res>  {
  factory $CenterCopyWith(Center value, $Res Function(Center) _then) = _$CenterCopyWithImpl;
@useResult
$Res call({
 String id, String name, String location, String? notes, String? managerId
});




}
/// @nodoc
class _$CenterCopyWithImpl<$Res>
    implements $CenterCopyWith<$Res> {
  _$CenterCopyWithImpl(this._self, this._then);

  final Center _self;
  final $Res Function(Center) _then;

/// Create a copy of Center
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? location = null,Object? notes = freezed,Object? managerId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Center].
extension CenterPatterns on Center {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Center value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Center() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Center value)  $default,){
final _that = this;
switch (_that) {
case _Center():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Center value)?  $default,){
final _that = this;
switch (_that) {
case _Center() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String location,  String? notes,  String? managerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Center() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.notes,_that.managerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String location,  String? notes,  String? managerId)  $default,) {final _that = this;
switch (_that) {
case _Center():
return $default(_that.id,_that.name,_that.location,_that.notes,_that.managerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String location,  String? notes,  String? managerId)?  $default,) {final _that = this;
switch (_that) {
case _Center() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.notes,_that.managerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Center implements Center {
  const _Center({required this.id, required this.name, required this.location, this.notes, this.managerId});
  factory _Center.fromJson(Map<String, dynamic> json) => _$CenterFromJson(json);

@override final  String id;
@override final  String name;
@override final  String location;
@override final  String? notes;
@override final  String? managerId;

/// Create a copy of Center
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CenterCopyWith<_Center> get copyWith => __$CenterCopyWithImpl<_Center>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CenterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Center&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.managerId, managerId) || other.managerId == managerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,notes,managerId);

@override
String toString() {
  return 'Center(id: $id, name: $name, location: $location, notes: $notes, managerId: $managerId)';
}


}

/// @nodoc
abstract mixin class _$CenterCopyWith<$Res> implements $CenterCopyWith<$Res> {
  factory _$CenterCopyWith(_Center value, $Res Function(_Center) _then) = __$CenterCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String location, String? notes, String? managerId
});




}
/// @nodoc
class __$CenterCopyWithImpl<$Res>
    implements _$CenterCopyWith<$Res> {
  __$CenterCopyWithImpl(this._self, this._then);

  final _Center _self;
  final $Res Function(_Center) _then;

/// Create a copy of Center
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? location = null,Object? notes = freezed,Object? managerId = freezed,}) {
  return _then(_Center(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
