// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mosques_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MosquesState {

 List<Mosque> get mosques; DocumentSnapshot<Map<String, dynamic>>? get lastDoc; bool get hasReachedMax; bool get isLoading; String? get errorMessage; bool get isSelecting; Set<String> get selectedIds; String get query;
/// Create a copy of MosquesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MosquesStateCopyWith<MosquesState> get copyWith => _$MosquesStateCopyWithImpl<MosquesState>(this as MosquesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MosquesState&&const DeepCollectionEquality().equals(other.mosques, mosques)&&(identical(other.lastDoc, lastDoc) || other.lastDoc == lastDoc)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSelecting, isSelecting) || other.isSelecting == isSelecting)&&const DeepCollectionEquality().equals(other.selectedIds, selectedIds)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(mosques),lastDoc,hasReachedMax,isLoading,errorMessage,isSelecting,const DeepCollectionEquality().hash(selectedIds),query);

@override
String toString() {
  return 'MosquesState(mosques: $mosques, lastDoc: $lastDoc, hasReachedMax: $hasReachedMax, isLoading: $isLoading, errorMessage: $errorMessage, isSelecting: $isSelecting, selectedIds: $selectedIds, query: $query)';
}


}

/// @nodoc
abstract mixin class $MosquesStateCopyWith<$Res>  {
  factory $MosquesStateCopyWith(MosquesState value, $Res Function(MosquesState) _then) = _$MosquesStateCopyWithImpl;
@useResult
$Res call({
 List<Mosque> mosques, DocumentSnapshot<Map<String, dynamic>>? lastDoc, bool hasReachedMax, bool isLoading, String? errorMessage, bool isSelecting, Set<String> selectedIds, String query
});




}
/// @nodoc
class _$MosquesStateCopyWithImpl<$Res>
    implements $MosquesStateCopyWith<$Res> {
  _$MosquesStateCopyWithImpl(this._self, this._then);

  final MosquesState _self;
  final $Res Function(MosquesState) _then;

/// Create a copy of MosquesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mosques = null,Object? lastDoc = freezed,Object? hasReachedMax = null,Object? isLoading = null,Object? errorMessage = freezed,Object? isSelecting = null,Object? selectedIds = null,Object? query = null,}) {
  return _then(_self.copyWith(
mosques: null == mosques ? _self.mosques : mosques // ignore: cast_nullable_to_non_nullable
as List<Mosque>,lastDoc: freezed == lastDoc ? _self.lastDoc : lastDoc // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot<Map<String, dynamic>>?,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSelecting: null == isSelecting ? _self.isSelecting : isSelecting // ignore: cast_nullable_to_non_nullable
as bool,selectedIds: null == selectedIds ? _self.selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MosquesState].
extension MosquesStatePatterns on MosquesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MosquesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MosquesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MosquesState value)  $default,){
final _that = this;
switch (_that) {
case _MosquesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MosquesState value)?  $default,){
final _that = this;
switch (_that) {
case _MosquesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Mosque> mosques,  DocumentSnapshot<Map<String, dynamic>>? lastDoc,  bool hasReachedMax,  bool isLoading,  String? errorMessage,  bool isSelecting,  Set<String> selectedIds,  String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MosquesState() when $default != null:
return $default(_that.mosques,_that.lastDoc,_that.hasReachedMax,_that.isLoading,_that.errorMessage,_that.isSelecting,_that.selectedIds,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Mosque> mosques,  DocumentSnapshot<Map<String, dynamic>>? lastDoc,  bool hasReachedMax,  bool isLoading,  String? errorMessage,  bool isSelecting,  Set<String> selectedIds,  String query)  $default,) {final _that = this;
switch (_that) {
case _MosquesState():
return $default(_that.mosques,_that.lastDoc,_that.hasReachedMax,_that.isLoading,_that.errorMessage,_that.isSelecting,_that.selectedIds,_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Mosque> mosques,  DocumentSnapshot<Map<String, dynamic>>? lastDoc,  bool hasReachedMax,  bool isLoading,  String? errorMessage,  bool isSelecting,  Set<String> selectedIds,  String query)?  $default,) {final _that = this;
switch (_that) {
case _MosquesState() when $default != null:
return $default(_that.mosques,_that.lastDoc,_that.hasReachedMax,_that.isLoading,_that.errorMessage,_that.isSelecting,_that.selectedIds,_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _MosquesState implements MosquesState {
  const _MosquesState({final  List<Mosque> mosques = const <Mosque>[], this.lastDoc, this.hasReachedMax = false, this.isLoading = false, this.errorMessage, this.isSelecting = false, final  Set<String> selectedIds = const <String>{}, this.query = ''}): _mosques = mosques,_selectedIds = selectedIds;
  

 final  List<Mosque> _mosques;
@override@JsonKey() List<Mosque> get mosques {
  if (_mosques is EqualUnmodifiableListView) return _mosques;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mosques);
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

/// Create a copy of MosquesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MosquesStateCopyWith<_MosquesState> get copyWith => __$MosquesStateCopyWithImpl<_MosquesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MosquesState&&const DeepCollectionEquality().equals(other._mosques, _mosques)&&(identical(other.lastDoc, lastDoc) || other.lastDoc == lastDoc)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSelecting, isSelecting) || other.isSelecting == isSelecting)&&const DeepCollectionEquality().equals(other._selectedIds, _selectedIds)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_mosques),lastDoc,hasReachedMax,isLoading,errorMessage,isSelecting,const DeepCollectionEquality().hash(_selectedIds),query);

@override
String toString() {
  return 'MosquesState(mosques: $mosques, lastDoc: $lastDoc, hasReachedMax: $hasReachedMax, isLoading: $isLoading, errorMessage: $errorMessage, isSelecting: $isSelecting, selectedIds: $selectedIds, query: $query)';
}


}

/// @nodoc
abstract mixin class _$MosquesStateCopyWith<$Res> implements $MosquesStateCopyWith<$Res> {
  factory _$MosquesStateCopyWith(_MosquesState value, $Res Function(_MosquesState) _then) = __$MosquesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Mosque> mosques, DocumentSnapshot<Map<String, dynamic>>? lastDoc, bool hasReachedMax, bool isLoading, String? errorMessage, bool isSelecting, Set<String> selectedIds, String query
});




}
/// @nodoc
class __$MosquesStateCopyWithImpl<$Res>
    implements _$MosquesStateCopyWith<$Res> {
  __$MosquesStateCopyWithImpl(this._self, this._then);

  final _MosquesState _self;
  final $Res Function(_MosquesState) _then;

/// Create a copy of MosquesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mosques = null,Object? lastDoc = freezed,Object? hasReachedMax = null,Object? isLoading = null,Object? errorMessage = freezed,Object? isSelecting = null,Object? selectedIds = null,Object? query = null,}) {
  return _then(_MosquesState(
mosques: null == mosques ? _self._mosques : mosques // ignore: cast_nullable_to_non_nullable
as List<Mosque>,lastDoc: freezed == lastDoc ? _self.lastDoc : lastDoc // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot<Map<String, dynamic>>?,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSelecting: null == isSelecting ? _self.isSelecting : isSelecting // ignore: cast_nullable_to_non_nullable
as bool,selectedIds: null == selectedIds ? _self._selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
