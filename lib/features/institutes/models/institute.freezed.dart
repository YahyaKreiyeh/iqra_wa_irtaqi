// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'institute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Institute {

 String get id; String get name; String get location; String? get notes;
/// Create a copy of Institute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstituteCopyWith<Institute> get copyWith => _$InstituteCopyWithImpl<Institute>(this as Institute, _$identity);

  /// Serializes this Institute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Institute&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,notes);

@override
String toString() {
  return 'Institute(id: $id, name: $name, location: $location, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $InstituteCopyWith<$Res>  {
  factory $InstituteCopyWith(Institute value, $Res Function(Institute) _then) = _$InstituteCopyWithImpl;
@useResult
$Res call({
 String id, String name, String location, String? notes
});




}
/// @nodoc
class _$InstituteCopyWithImpl<$Res>
    implements $InstituteCopyWith<$Res> {
  _$InstituteCopyWithImpl(this._self, this._then);

  final Institute _self;
  final $Res Function(Institute) _then;

/// Create a copy of Institute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? location = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Institute].
extension InstitutePatterns on Institute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Institute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Institute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Institute value)  $default,){
final _that = this;
switch (_that) {
case _Institute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Institute value)?  $default,){
final _that = this;
switch (_that) {
case _Institute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String location,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Institute() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String location,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Institute():
return $default(_that.id,_that.name,_that.location,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String location,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Institute() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Institute implements Institute {
  const _Institute({required this.id, required this.name, required this.location, this.notes});
  factory _Institute.fromJson(Map<String, dynamic> json) => _$InstituteFromJson(json);

@override final  String id;
@override final  String name;
@override final  String location;
@override final  String? notes;

/// Create a copy of Institute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstituteCopyWith<_Institute> get copyWith => __$InstituteCopyWithImpl<_Institute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstituteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Institute&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,notes);

@override
String toString() {
  return 'Institute(id: $id, name: $name, location: $location, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$InstituteCopyWith<$Res> implements $InstituteCopyWith<$Res> {
  factory _$InstituteCopyWith(_Institute value, $Res Function(_Institute) _then) = __$InstituteCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String location, String? notes
});




}
/// @nodoc
class __$InstituteCopyWithImpl<$Res>
    implements _$InstituteCopyWith<$Res> {
  __$InstituteCopyWithImpl(this._self, this._then);

  final _Institute _self;
  final $Res Function(_Institute) _then;

/// Create a copy of Institute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? location = null,Object? notes = freezed,}) {
  return _then(_Institute(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
