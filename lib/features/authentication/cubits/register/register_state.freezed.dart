// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState {

 Result get status; String get email; String? get emailError; String get password; String? get passwordError; String get confirmedPassword; String? get confirmedPasswordError;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmedPassword, confirmedPassword) || other.confirmedPassword == confirmedPassword)&&(identical(other.confirmedPasswordError, confirmedPasswordError) || other.confirmedPasswordError == confirmedPasswordError));
}


@override
int get hashCode => Object.hash(runtimeType,status,email,emailError,password,passwordError,confirmedPassword,confirmedPasswordError);

@override
String toString() {
  return 'RegisterState(status: $status, email: $email, emailError: $emailError, password: $password, passwordError: $passwordError, confirmedPassword: $confirmedPassword, confirmedPasswordError: $confirmedPasswordError)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 Result status, String email, String? emailError, String password, String? passwordError, String confirmedPassword, String? confirmedPasswordError
});


$ResultCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? email = null,Object? emailError = freezed,Object? password = null,Object? passwordError = freezed,Object? confirmedPassword = null,Object? confirmedPasswordError = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Result,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmedPassword: null == confirmedPassword ? _self.confirmedPassword : confirmedPassword // ignore: cast_nullable_to_non_nullable
as String,confirmedPasswordError: freezed == confirmedPasswordError ? _self.confirmedPasswordError : confirmedPasswordError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res> get status {
  
  return $ResultCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterState value)  $default,){
final _that = this;
switch (_that) {
case _RegisterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Result status,  String email,  String? emailError,  String password,  String? passwordError,  String confirmedPassword,  String? confirmedPasswordError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.status,_that.email,_that.emailError,_that.password,_that.passwordError,_that.confirmedPassword,_that.confirmedPasswordError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Result status,  String email,  String? emailError,  String password,  String? passwordError,  String confirmedPassword,  String? confirmedPasswordError)  $default,) {final _that = this;
switch (_that) {
case _RegisterState():
return $default(_that.status,_that.email,_that.emailError,_that.password,_that.passwordError,_that.confirmedPassword,_that.confirmedPasswordError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Result status,  String email,  String? emailError,  String password,  String? passwordError,  String confirmedPassword,  String? confirmedPasswordError)?  $default,) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.status,_that.email,_that.emailError,_that.password,_that.passwordError,_that.confirmedPassword,_that.confirmedPasswordError);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterState implements RegisterState {
   _RegisterState({this.status = const Result.empty(), this.email = '', this.emailError = null, this.password = '', this.passwordError = null, this.confirmedPassword = '', this.confirmedPasswordError = null});
  

@override@JsonKey() final  Result status;
@override@JsonKey() final  String email;
@override@JsonKey() final  String? emailError;
@override@JsonKey() final  String password;
@override@JsonKey() final  String? passwordError;
@override@JsonKey() final  String confirmedPassword;
@override@JsonKey() final  String? confirmedPasswordError;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmedPassword, confirmedPassword) || other.confirmedPassword == confirmedPassword)&&(identical(other.confirmedPasswordError, confirmedPasswordError) || other.confirmedPasswordError == confirmedPasswordError));
}


@override
int get hashCode => Object.hash(runtimeType,status,email,emailError,password,passwordError,confirmedPassword,confirmedPasswordError);

@override
String toString() {
  return 'RegisterState(status: $status, email: $email, emailError: $emailError, password: $password, passwordError: $passwordError, confirmedPassword: $confirmedPassword, confirmedPasswordError: $confirmedPasswordError)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 Result status, String email, String? emailError, String password, String? passwordError, String confirmedPassword, String? confirmedPasswordError
});


@override $ResultCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? email = null,Object? emailError = freezed,Object? password = null,Object? passwordError = freezed,Object? confirmedPassword = null,Object? confirmedPasswordError = freezed,}) {
  return _then(_RegisterState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Result,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmedPassword: null == confirmedPassword ? _self.confirmedPassword : confirmedPassword // ignore: cast_nullable_to_non_nullable
as String,confirmedPasswordError: freezed == confirmedPasswordError ? _self.confirmedPasswordError : confirmedPasswordError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RegisterState
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
