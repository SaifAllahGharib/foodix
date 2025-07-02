// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {

 PageState<void> get status; Map<int, int> get countMap;
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStateCopyWith<CartState> get copyWith => _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.countMap, countMap));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(countMap));

@override
String toString() {
  return 'CartState(status: $status, countMap: $countMap)';
}


}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res>  {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) = _$CartStateCopyWithImpl;
@useResult
$Res call({
 PageState<void> status, Map<int, int> countMap
});


$PageStateCopyWith<void, $Res> get status;

}
/// @nodoc
class _$CartStateCopyWithImpl<$Res>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? countMap = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState<void>,countMap: null == countMap ? _self.countMap : countMap // ignore: cast_nullable_to_non_nullable
as Map<int, int>,
  ));
}
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<void, $Res> get status {
  
  return $PageStateCopyWith<void, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc


class _CartState implements CartState {
  const _CartState({this.status = const PageState.init(), final  Map<int, int> countMap = const {}}): _countMap = countMap;
  

@override@JsonKey() final  PageState<void> status;
 final  Map<int, int> _countMap;
@override@JsonKey() Map<int, int> get countMap {
  if (_countMap is EqualUnmodifiableMapView) return _countMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_countMap);
}


/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStateCopyWith<_CartState> get copyWith => __$CartStateCopyWithImpl<_CartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._countMap, _countMap));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_countMap));

@override
String toString() {
  return 'CartState(status: $status, countMap: $countMap)';
}


}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(_CartState value, $Res Function(_CartState) _then) = __$CartStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<void> status, Map<int, int> countMap
});


@override $PageStateCopyWith<void, $Res> get status;

}
/// @nodoc
class __$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? countMap = null,}) {
  return _then(_CartState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState<void>,countMap: null == countMap ? _self._countMap : countMap // ignore: cast_nullable_to_non_nullable
as Map<int, int>,
  ));
}

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<void, $Res> get status {
  
  return $PageStateCopyWith<void, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
