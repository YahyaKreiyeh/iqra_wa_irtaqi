// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mosque.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Mosque {

@JsonKey(ignore: true) String? get id; String get name; String get location; String? get notes;
/// Create a copy of Mosque
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MosqueCopyWith<Mosque> get copyWith => _$MosqueCopyWithImpl<Mosque>(this as Mosque, _$identity);

  /// Serializes this Mosque to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Mosque&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,notes);

@override
String toString() {
  return 'Mosque(id: $id, name: $name, location: $location, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $MosqueCopyWith<$Res>  {
  factory $MosqueCopyWith(Mosque value, $Res Function(Mosque) _then) = _$MosqueCopyWithImpl;
@useResult
$Res call({
@JsonKey(ignore: true) String? id, String name, String location, String? notes
});




}
/// @nodoc
class _$MosqueCopyWithImpl<$Res>
    implements $MosqueCopyWith<$Res> {
  _$MosqueCopyWithImpl(this._self, this._then);

  final Mosque _self;
  final $Res Function(Mosque) _then;

/// Create a copy of Mosque
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? location = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Mosque].
extension MosquePatterns on Mosque {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Mosque value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Mosque() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Mosque value)  $default,){
final _that = this;
switch (_that) {
case _Mosque():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Mosque value)?  $default,){
final _that = this;
switch (_that) {
case _Mosque() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(ignore: true)  String? id,  String name,  String location,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Mosque() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(ignore: true)  String? id,  String name,  String location,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Mosque():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(ignore: true)  String? id,  String name,  String location,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Mosque() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Mosque implements Mosque {
  const _Mosque({@JsonKey(ignore: true) this.id, required this.name, required this.location, this.notes});
  factory _Mosque.fromJson(Map<String, dynamic> json) => _$MosqueFromJson(json);

@override@JsonKey(ignore: true) final  String? id;
@override final  String name;
@override final  String location;
@override final  String? notes;

/// Create a copy of Mosque
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MosqueCopyWith<_Mosque> get copyWith => __$MosqueCopyWithImpl<_Mosque>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MosqueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Mosque&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,notes);

@override
String toString() {
  return 'Mosque(id: $id, name: $name, location: $location, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$MosqueCopyWith<$Res> implements $MosqueCopyWith<$Res> {
  factory _$MosqueCopyWith(_Mosque value, $Res Function(_Mosque) _then) = __$MosqueCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(ignore: true) String? id, String name, String location, String? notes
});




}
/// @nodoc
class __$MosqueCopyWithImpl<$Res>
    implements _$MosqueCopyWith<$Res> {
  __$MosqueCopyWithImpl(this._self, this._then);

  final _Mosque _self;
  final $Res Function(_Mosque) _then;

/// Create a copy of Mosque
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? location = null,Object? notes = freezed,}) {
  return _then(_Mosque(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
