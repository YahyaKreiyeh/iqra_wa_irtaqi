// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasswordResetState {

 Result get status; String get email; String? get emailError;
/// Create a copy of PasswordResetState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordResetStateCopyWith<PasswordResetState> get copyWith => _$PasswordResetStateCopyWithImpl<PasswordResetState>(this as PasswordResetState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordResetState&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailError, emailError) || other.emailError == emailError));
}


@override
int get hashCode => Object.hash(runtimeType,status,email,emailError);

@override
String toString() {
  return 'PasswordResetState(status: $status, email: $email, emailError: $emailError)';
}


}

/// @nodoc
abstract mixin class $PasswordResetStateCopyWith<$Res>  {
  factory $PasswordResetStateCopyWith(PasswordResetState value, $Res Function(PasswordResetState) _then) = _$PasswordResetStateCopyWithImpl;
@useResult
$Res call({
 Result status, String email, String? emailError
});


$ResultCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class _$PasswordResetStateCopyWithImpl<$Res>
    implements $PasswordResetStateCopyWith<$Res> {
  _$PasswordResetStateCopyWithImpl(this._self, this._then);

  final PasswordResetState _self;
  final $Res Function(PasswordResetState) _then;

/// Create a copy of PasswordResetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? email = null,Object? emailError = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Result,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PasswordResetState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res> get status {
  
  return $ResultCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [PasswordResetState].
extension PasswordResetStatePatterns on PasswordResetState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordResetState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordResetState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordResetState value)  $default,){
final _that = this;
switch (_that) {
case _PasswordResetState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordResetState value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordResetState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Result status,  String email,  String? emailError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordResetState() when $default != null:
return $default(_that.status,_that.email,_that.emailError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Result status,  String email,  String? emailError)  $default,) {final _that = this;
switch (_that) {
case _PasswordResetState():
return $default(_that.status,_that.email,_that.emailError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Result status,  String email,  String? emailError)?  $default,) {final _that = this;
switch (_that) {
case _PasswordResetState() when $default != null:
return $default(_that.status,_that.email,_that.emailError);case _:
  return null;

}
}

}

/// @nodoc


class _PasswordResetState implements PasswordResetState {
   _PasswordResetState({this.status = const Result.empty(), this.email = '', this.emailError = null});
  

@override@JsonKey() final  Result status;
@override@JsonKey() final  String email;
@override@JsonKey() final  String? emailError;

/// Create a copy of PasswordResetState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordResetStateCopyWith<_PasswordResetState> get copyWith => __$PasswordResetStateCopyWithImpl<_PasswordResetState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordResetState&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailError, emailError) || other.emailError == emailError));
}


@override
int get hashCode => Object.hash(runtimeType,status,email,emailError);

@override
String toString() {
  return 'PasswordResetState(status: $status, email: $email, emailError: $emailError)';
}


}

/// @nodoc
abstract mixin class _$PasswordResetStateCopyWith<$Res> implements $PasswordResetStateCopyWith<$Res> {
  factory _$PasswordResetStateCopyWith(_PasswordResetState value, $Res Function(_PasswordResetState) _then) = __$PasswordResetStateCopyWithImpl;
@override @useResult
$Res call({
 Result status, String email, String? emailError
});


@override $ResultCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class __$PasswordResetStateCopyWithImpl<$Res>
    implements _$PasswordResetStateCopyWith<$Res> {
  __$PasswordResetStateCopyWithImpl(this._self, this._then);

  final _PasswordResetState _self;
  final $Res Function(_PasswordResetState) _then;

/// Create a copy of PasswordResetState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? email = null,Object? emailError = freezed,}) {
  return _then(_PasswordResetState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Result,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PasswordResetState
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
